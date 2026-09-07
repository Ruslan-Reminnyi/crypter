import 'package:crypter/data/models/order/order.dart';

class OrdersState {
  final List<Order> orders;
  final bool isLoading;
  final String? error;

  const OrdersState({this.orders = const [], this.isLoading = false, this.error});

  OrdersState copyWith({List<Order>? orders, bool? isLoading, String? error}) {
    return OrdersState(
      orders: orders ?? this.orders,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
