import 'package:crypter/data/models/order/order.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orders_notifier.g.dart';

@riverpod
class OrdersNotifier extends _$OrdersNotifier {
  @override
  List<Order> build() => [];

  void saveOrder(Order order) {
    state = state..removeWhere((item) => item.number == order.number);
    state = [...state, order];
  }

  void deleteOrder(int number) {
    state = state.where((item) => item.number != number).toList();
  }
}
