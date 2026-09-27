import 'package:candlesticks/candlesticks.dart';
import 'package:crypter/core/app/navigation/app_routes.dart';
import 'package:crypter/core/di/providers/app_providers.dart';
import 'package:crypter/core/styles/app_fonts.dart';
import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:crypter/domain/enums/exchange.dart';
import 'package:crypter/domain/enums/form_factor.dart';
import 'package:crypter/domain/enums/interval.dart';
import 'package:crypter/domain/enums/symbol.dart';
import 'package:crypter/presentation/common/dialogs/app_dialog.dart';
import 'package:crypter/presentation/common/widgets/app_button.dart';
import 'package:crypter/presentation/common/widgets/app_responsive_builder/app_responsive_builder.dart';
import 'package:crypter/presentation/common/widgets/app_scaffold/app_scaffold.dart';
import 'package:crypter/presentation/common/widgets/parameter_setting.dart';
import 'package:crypter/presentation/features/ai/widgets/limit_parameter_setting.dart';
import 'package:crypter/presentation/features/chart/notifiers/chart_notifier.dart';
import 'package:crypter/presentation/features/chart/providers/crypto_info_repository_stream.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Interval;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChartScreen extends ConsumerStatefulWidget {
  final String title;

  const ChartScreen({super.key, required this.title});

  @override
  ConsumerState<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends ConsumerState<ChartScreen> with RouteAware {
  late final provider = ref.watch(chartProvider.notifier);
  late final routeProvider = ref.watch(routerProvider);
  bool _isDialogOpen = false;

  @override
  void didChangeDependencies() {
    routeProvider.routeObserver.subscribe(this, ModalRoute.of(context)!);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    routeProvider.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPushNext() {
    if (!_isDialogOpen) {
      provider.unsubscribeFromWebSocket();
    }
  }

  @override
  void didPopNext() {
    if (!_isDialogOpen) {
      provider.subscribeToWebSocket();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: _NavigationBar(
        navigateToOrders: () => context.go('${AppRoutes.chart.path}${AppRoutes.allOrders.path}'),
        navigateToAIAssistance: () => context.go('${AppRoutes.chart.path}${AppRoutes.ai.path}'),
        navigateToTalkerScreen: () => context.go('${AppRoutes.chart.path}${AppRoutes.talker.path}'),
      ),
      body: Column(
        children: [
          _AppBar(
            title: widget.title,
            callback: () async {
              _isDialogOpen = true;
              final isConfirmed = await AppDialog.logout(context);
              if (isConfirmed == true) {
                try {
                  await provider.logout();
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                }

                if (context.mounted) {
                  context.go(AppRoutes.login.path);
                }
              } else {
                _isDialogOpen = false;
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: _SettingsSection(
              symbolSetting: ParameterSetting<Symbol>(
                label: context.l10n.symbol,
                values: Symbol.values,
                itemBuilder: (symbol) => symbol.displayName,
                onSelected: (item) {},
              ),
              intervalSetting: ParameterSetting<Interval>(
                label: context.l10n.interval,
                values: Interval.values,
                itemBuilder: (interval) => interval.timeframe,
                onSelected: (item) {},
              ),
              limitSetting: LimitRequestSetting(),
              exchangeSetting: ParameterSetting<Exchange>(
                label: context.l10n.exchange,
                values: Exchange.values,
                itemBuilder: (exchange) => exchange.displayName,
                onSelected: (item) {},
              ),
            ),
          ),
          ref
              .watch(candlesProvider)
              .when(
                data: (List<Candle> candles) => Flexible(child: Candlesticks(candles: candles)),
                error: (Object error, StackTrace stackTrace) =>
                    Text("Error showing List<Candle> - $error\n$stackTrace"),
                loading: () => const CircularProgressIndicator(),
              ),
        ],
      ),
    );
  }
}

class _AppBarTextButton extends StatelessWidget {
  final String _label;
  final VoidCallback _callback;

  const _AppBarTextButton(this._label, this._callback);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _callback,
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(color: Theme.of(context).colorScheme.inverseSurface),
        ),
        overlayColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.surface),
      ),
      child: Text(
        _label,
        style: AppTextStyles.button.copyWith(color: context.colors.bodySmall, height: 1.25),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  final VoidCallback _callback;
  final String _title;

  const _AppBar({required this._title, required this._callback});

  @override
  Widget build(BuildContext context) {
    final mobileAndTabletLayout = AppBar(
      leading: FlutterLogo(),
      title: Text(_title, style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24)),
      centerTitle: false,
      actions: [IconButton(icon: Icon(Icons.logout), onPressed: _callback)],
    );
    final desktopLayout = SizedBox(
      height: 70.0,
      child: ColoredBox(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Row(
                spacing: 4.0,
                children: [
                  FlutterLogo(),
                  Text(
                    _title,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24.0),
                  ),
                ],
              ),
              SizedBox(width: 16.0),
              SizedBox(
                height: 36.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      spacing: 12.0,
                      children: [
                        _AppBarTextButton(
                          context.l10n.orders,
                          () => context.go('${AppRoutes.chart.path}${AppRoutes.allOrders.path}'),
                        ),
                        _AppBarTextButton(
                          context.l10n.aiAssistance,
                          () => context.go('${AppRoutes.chart.path}${AppRoutes.ai.path}'),
                        ),
                        if (kDebugMode)
                          Tooltip(
                            message: context.l10n.talkerScreen,
                            child: _AppBarTextButton(
                              context.l10n.logs,
                              () => context.go('${AppRoutes.chart.path}${AppRoutes.talker.path}'),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                width: 170.0,
                child: AppButton(
                  label: context.l10n.logout,
                  callback: _callback,
                  prefixIcon: Icons.logout,
                  labelColor: context.colors.bodySmall,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderColor: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return context.responsiveValue(
      mobile: () => mobileAndTabletLayout,
      tablet: () => mobileAndTabletLayout,
      desktop: () => desktopLayout,
    );
  }
}

class _NavigationBar extends StatefulWidget {
  final VoidCallback _navigateToOrders;
  final VoidCallback _navigateToAIAssistance;
  final VoidCallback _navigateToTalkerScreen;

  const _NavigationBar({
    required this._navigateToOrders,
    required this._navigateToAIAssistance,
    required this._navigateToTalkerScreen,
  });

  @override
  State<_NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<_NavigationBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final mobileAndTabletLayout = NavigationBar(
      destinations: [
        NavigationDestination(
          icon: Icon(
            Icons.candlestick_chart_rounded,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
          selectedIcon: Icon(
            Icons.candlestick_chart_rounded,
            color: Theme.of(context).colorScheme.primary,
          ),
          label: context.l10n.chart,
        ),
        NavigationDestination(
          icon: Icon(
            Icons.content_paste_rounded,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
          selectedIcon: Icon(
            Icons.content_paste_rounded,
            color: Theme.of(context).colorScheme.primary,
          ),
          label: context.l10n.orders,
        ),
        NavigationDestination(
          icon: Icon(
            Icons.auto_awesome_rounded,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
          selectedIcon: Icon(
            Icons.auto_awesome_rounded,
            color: Theme.of(context).colorScheme.primary,
          ),
          label: context.l10n.aiAssistance,
        ),
        if (kDebugMode)
          NavigationDestination(
            icon: Icon(Icons.logo_dev_rounded, color: Theme.of(context).colorScheme.inverseSurface),
            selectedIcon: Icon(
              Icons.logo_dev_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            label: context.l10n.logs,
            tooltip: context.l10n.talkerScreen,
          ),
      ],
      selectedIndex: _index,
      onDestinationSelected: (index) => setState(() {
        _index = index;

        if (index == 1) {
          widget._navigateToOrders.call();
        } else if (index == 2) {
          widget._navigateToAIAssistance.call();
        } else {
          widget._navigateToTalkerScreen.call();
        }
      }),
    );
    final desktopLayout = SizedBox.shrink();

    return AppResponsiveBuilder(
      builder: (_, formFactor) {
        return formFactor.map(
          mobile: () => mobileAndTabletLayout,
          tablet: () => mobileAndTabletLayout,
          desktop: () => desktopLayout,
        );
      },
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final Widget _symbolSetting;
  final Widget _intervalSetting;
  final Widget _limitSetting;
  final Widget _exchangeSetting;

  const _SettingsSection({
    required this._symbolSetting,
    required this._intervalSetting,
    required this._limitSetting,
    required this._exchangeSetting,
  });

  @override
  Widget build(BuildContext context) {
    final mobileLayout = Column(
      mainAxisSize: .min,
      spacing: 12.0,
      children: [_symbolSetting, _intervalSetting, _limitSetting, _exchangeSetting],
    );
    final tabletLayout = Column(
      spacing: 12.0,
      children: [
        Row(spacing: 12.0, children: [_symbolSetting, _intervalSetting]),
        Row(spacing: 12.0, children: [_limitSetting, _exchangeSetting]),
      ],
    );
    final desktopLayout = Row(
      spacing: 12.0,
      children: [_symbolSetting, _intervalSetting, _limitSetting, _exchangeSetting],
    );

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: AppResponsiveBuilder(
        builder: (_, formFactor) {
          return formFactor.map(
            mobile: () => mobileLayout,
            tablet: () => tabletLayout,
            desktop: () => desktopLayout,
          );
        },
      ),
    );
  }
}
