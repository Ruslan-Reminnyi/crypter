import 'package:crypter/data/models/order/order.dart';

abstract interface class LocalDatabaseService {
  Future<void> create();
  Future<int> insert(Order order);
  Future<void> update(Order order);
  Future<Order> get(int id);
  Future<List<Order>> getAll();
  Future<void> delete(int number);
  Future<void> close();
}
