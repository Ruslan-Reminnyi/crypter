import 'package:crypter/core/di/providers/app_providers.dart';
import 'package:crypter/data/models/order/order.dart';
import 'package:crypter/presentation/features/orders/notifiers/orders_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_by_id_provider.g.dart';

@riverpod
Future<Order> orderById(Ref ref, int id) async {
  final orders = ref.watch(ordersProvider).orders;
  final orderFromState = orders.where((item) => item.id == id).firstOrNull;

  if (orderFromState != null) {
    return orderFromState;
  } else {
    return await ref.watch(sqfliteServiceProvider).getOrder(id);
  }
}
