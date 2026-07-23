import 'package:crypter/core/app/navigation/app_routes.dart';
import 'package:crypter/domain/enums/order_tab.dart';
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
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          onTap: (index) => widget.navigationShell.goBranch(index),
          tabs: OrderTab.values.map((tab) => Tab(text: tab.displayName)).toList(),
        ),
      ),
      body: widget.navigationShell,
      floatingActionButton: Consumer(
        builder: (context, ref, child) => FloatingActionButton(
          onPressed: () => context.push(AppRoutes.orderFullPath),
          child: Icon(Icons.add_outlined),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
