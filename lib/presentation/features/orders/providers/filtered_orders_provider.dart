import 'package:crypter/data/models/order/order.dart';
import 'package:crypter/domain/enums/order_status.dart';
import 'package:crypter/domain/enums/order_tab.dart';
import 'package:crypter/presentation/features/orders/notifiers/orders_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_orders_provider.g.dart';

@riverpod
List<Order> filteredOrders(Ref ref, OrderTab ordersTab) {
  final orders = ref.watch(ordersProvider).orders;

  return switch (ordersTab) {
    OrderTab.all => orders,
    OrderTab.working => orders.where((item) => item.status == OrderStatus.working).toList(),
    OrderTab.filled => orders.where((item) => item.status == OrderStatus.filled).toList(),
  };
}
