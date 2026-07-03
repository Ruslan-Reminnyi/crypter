import 'package:crypter/data/models/order/order.dart';
import 'package:crypter/presentation/features/orders/notifiers/orders_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_by_id_provider.g.dart';

@riverpod
Order orderById(Ref ref, int id) {
  final orders = ref.watch(ordersProvider);
  return orders.firstWhere((item) => item.id == id);
}
