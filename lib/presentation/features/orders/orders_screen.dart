import 'package:crypter/core/app/navigation/app_routes.dart';
import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:crypter/domain/enums/order_tab.dart';
import 'package:crypter/presentation/common/widgets/app_button.dart';
import 'package:crypter/presentation/common/widgets/app_scaffold/app_scaffold.dart';
import 'package:crypter/presentation/features/orders/notifiers/orders_notifier.dart';
import 'package:crypter/presentation/features/orders/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OrdersScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const OrdersScreen(this.navigationShell, {super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: OrderTab.values.length,
      vsync: this,
      initialIndex: widget.navigationShell.currentIndex,
    );
  }

  @override
  void didUpdateWidget(covariant OrdersScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_tabController.index != widget.navigationShell.currentIndex) {
      _tabController.animateTo(widget.navigationShell.currentIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Row(
        mainAxisSize: .min,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  margin: EdgeInsets.fromLTRB(
                    24.0,
                    24.0,
                    context.responsiveValue(
                      mobile: () => 24.0,
                      tablet: () => 24.0,
                      desktop: () => 12.0,
                    ),
                    0.0,
                  ),
                  child: Column(
                    children: [
                      AppButton(
                        label: context.l10n.createOrder,
                        callback: () => context.push(AppRoutes.orderFullPath),
                        prefixIcon: Icons.add_rounded,
                      ),
                      SizedBox(height: 12.0),
                      Container(
                        height: 36.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        padding: const EdgeInsets.all(4.0),
                        child: TabBar(
                          controller: _tabController,
                          onTap: (index) => widget.navigationShell.goBranch(index),
                          tabs: OrderTab.values
                              .map((tab) => Tab(text: tab.displayName.toUpperCase()))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: widget.navigationShell),
              ],
            ),
          ),
          _DetailsSection(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class _DetailsSection extends ConsumerWidget {
  const _DetailsSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return context.responsiveValue(
      mobile: () => SizedBox.shrink(),
      tablet: () => SizedBox.shrink(),
      desktop: () {
        final firstOrderId = ref.read(ordersProvider).orders.firstOrNull?.id;

        return Expanded(
          flex: 2,
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.fromLTRB(12.0, 24.0, 24.0, 24.0),
            child: OrderPage(firstOrderId),
          ),
        );
      },
    );
  }
}
