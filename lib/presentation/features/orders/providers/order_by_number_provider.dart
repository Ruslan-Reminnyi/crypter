import 'package:crypter/data/models/order/order.dart';
import 'package:crypter/presentation/features/orders/notifiers/orders_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_by_number_provider.g.dart';

@riverpod
Order orderByNumber(Ref ref, int number) {
  final orders = ref.watch(ordersProvider);
  return orders.firstWhere((item) => item.number == number);
}
