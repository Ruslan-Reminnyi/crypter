import 'package:crypter/data/models/order/order.dart';

abstract interface class LocalDatabaseService {
  Future<void> create();
  Future<int> insertOrder(Order order);
  Future<void> updateOrder(Order order);
  Future<Order> getOrder(int id);
  Future<List<Order>> getAllOrders();
  Future<void> deleteOrder(int number);
  Future<void> close();
}
