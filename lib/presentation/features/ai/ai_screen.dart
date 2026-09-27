import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:crypter/data/models/ai/recommendations/ai_recommendation.dart';
import 'package:crypter/domain/enums/exchange.dart';
import 'package:crypter/domain/enums/form_factor.dart';
import 'package:crypter/domain/enums/interval.dart';
import 'package:crypter/domain/enums/symbol.dart';
import 'package:crypter/presentation/common/validators/input_error.dart';
import 'package:crypter/presentation/common/validators/validators.dart';
import 'package:crypter/presentation/common/widgets/app_button.dart';
import 'package:crypter/presentation/common/widgets/app_responsive_builder/app_responsive_builder.dart';
import 'package:crypter/presentation/common/widgets/app_scaffold/app_scaffold.dart';
import 'package:crypter/presentation/features/ai/notifiers/ai_notifier.dart';
import 'package:crypter/presentation/features/ai/widgets/limit_parameter_setting.dart';
import 'package:crypter/presentation/features/ai/widgets/recommendation_tile.dart';
import 'package:crypter/presentation/common/widgets/parameter_setting.dart';
import 'package:flutter/material.dart' hide Interval;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AiScreen extends ConsumerStatefulWidget {
  const AiScreen({super.key});

  @override
  ConsumerState<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends ConsumerState<AiScreen> {
  final _formKey = GlobalKey<FormState>(debugLabel: 'ai_screen_global_key');

  final TextEditingController _promptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(aiProvider);
    final provider = ref.watch(aiProvider.notifier);

    return Stack(
      children: [
        AppScaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  title: Text(context.l10n.aiAssistance),
                  leading: IconButton(onPressed: context.pop, icon: Icon(Icons.arrow_back_rounded)),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      _SettingsSection(
                        symbolSetting: ParameterSetting<Symbol>(
                          label: context.l10n.symbol,
                          values: Symbol.values,
                          itemBuilder: (symbol) => symbol.displayName,
                          onSelected: (value) {
                            if (value != null) provider.changeSymbol(value);
                          },
                        ),
                        intervalSetting: ParameterSetting<Interval>(
                          label: context.l10n.interval,
                          values: Interval.values,
                          itemBuilder: (interval) => interval.timeframe,
                          onSelected: (value) {
                            if (value != null) provider.changeInterval(value);
                          },
                        ),
                        limitSetting: LimitRequestSetting(),
                        exchangeSetting: ParameterSetting<Exchange>(
                          label: context.l10n.exchange,
                          values: Exchange.values,
                          itemBuilder: (exchange) => exchange.displayName,
                          onSelected: (value) {},
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: .min,
                          children: [
                            _RectangleWithRoundedCorners([
                              Row(
                                crossAxisAlignment: .start,
                                spacing: 2,
                                children: [
                                  Icon(
                                    Icons.psychology_rounded,
                                    color: Theme.of(context).colorScheme.tertiaryContainer,
                                  ),
                                  Text(
                                    context.l10n.yourPrompt.toUpperCase(),
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: Theme.of(context).colorScheme.inverseSurface,
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                controller: _promptController,
                                decoration: InputDecoration(
                                  hintText:
                                      context.l10n.askAIToGenerateRecommendationsForCreatingOrder,
                                ),
                                textInputAction: .next,
                                maxLines: 4,
                                validator: (value) {
                                  final result = Validators.prompt(value);

                                  return switch (result) {
                                    EmptyInputError() => context.l10n.thisIsRequiredField,
                                    InvalidPromptFormatError() =>
                                      context.l10n.promptMustBeAtLeastTwentyCharacters,
                                    _ => null,
                                  };
                                },
                              ),
                              SizedBox(height: 2.0),
                              Align(
                                alignment: .centerRight,
                                child: Tooltip(
                                  message: context.l10n.generate,
                                  child: AppButton(
                                    callback: _askAI,
                                    label: context.l10n.askAI,
                                    suffixIcon: Icons.auto_awesome,
                                    width: context.responsiveValue(
                                      mobile: () => 180.0,
                                      tablet: () => 200.0,
                                      desktop: () => 240.0,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                      if (state.recommendations.isNotEmpty) ...[
                        SizedBox(height: 24.0),
                        _RectangleWithRoundedCorners([
                          Text(
                            state.title,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.inverseSurface,
                            ),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: SizedBox(
                              width: .infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  state.description,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.inverseSurface,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                        SizedBox(height: 16.0),
                        Row(
                          spacing: 2.0,
                          children: [
                            Icon(
                              Icons.call_split,
                              size: 16.0,
                              color: context.colors.tertiaryContainer,
                            ),
                            Text(
                              context.l10n.tacticalScenarios.toUpperCase(),
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Theme.of(context).colorScheme.inverseSurface,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        _RecommendationsSection(recommendations: state.recommendations),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (state.isLoading)
          AbsorbPointer(
            child: SizedBox(
              width: context.screenWidth,
              height: context.screenHeight,
              child: ColoredBox(
                color: Colors.black45,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
      ],
    );
  }

  void _askAI() {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        ref.read(aiProvider.notifier).generateOrderCreationRecommendations(_promptController.text);

        _promptController.clear();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  @override
  void dispose() {
    _promptController.dispose();

    super.dispose();
  }
}

class _RectangleWithRoundedCorners extends StatelessWidget {
  final List<Widget> _widgets;

  const _RectangleWithRoundedCorners(this._widgets);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: .start, spacing: 8.0, children: [..._widgets]),
      ),
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

class _RecommendationsSection extends StatelessWidget {
  final List<AiRecommendation> _recommendations;

  const _RecommendationsSection({required this._recommendations});

  @override
  Widget build(BuildContext context) {
    final aiRecommendations = _recommendations.indexed.map(
      (item) => Flexible(
        child: RecommendationTile(recommendation: item.$2, number: item.$1 + 1),
      ),
    );

    final mobileLayout = Column(
      mainAxisSize: .min,
      spacing: 12.0,
      children: [...aiRecommendations],
    );
    final tabletAndDesktopLayout = Row(spacing: 12.0, children: [...aiRecommendations]);

    return SingleChildScrollView(
      child: AppResponsiveBuilder(
        builder: (_, formFactor) {
          return formFactor.map(
            mobile: () => mobileLayout,
            tablet: () => tabletAndDesktopLayout,
            desktop: () => tabletAndDesktopLayout,
          );
        },
      ),
    );
  }
}
