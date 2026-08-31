import 'package:crypter/core/di/providers/app_providers.dart';
import 'package:crypter/data/models/firebase_messaging_notification/firebase_messaging_notification.dart';
import 'package:crypter/data/models/order/order.dart';
import 'package:crypter/domain/services/local/local_database_service.dart';
import 'package:crypter/domain/services/remote/remote_database_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker/talker.dart';

part 'orders_notifier.g.dart';

@riverpod
class OrdersNotifier extends _$OrdersNotifier {
  LocalDatabaseService get _databaseService => ref.read(sqfliteServiceProvider);
  RemoteDatabaseService get _remoteDatabaseService => ref.watch(laravelDatabaseServiceProvider);
  Talker get _talker => ref.read(talkerProvider);

  @override
  List<Order> build() {
    _getInitialState();
    return [];
  }

  Future<void> _getInitialState() async {
    try {
      final allOrdersFromRemoteDb = await _remoteDatabaseService.getAllOrders();

      if (allOrdersFromRemoteDb.isNotEmpty) {
        state = allOrdersFromRemoteDb;
      } else {
        final allOrdersFromLocalDb = await _databaseService.getAllOrders();
        if (allOrdersFromLocalDb.isNotEmpty) {
          state = allOrdersFromLocalDb;
        } else {
          state = [];
        }
      }
    } catch (e, st) {
      _talker.error('Error getting all orders - ', e, st);
      state = [];
    }
  }

  Future<int?> saveOrder(Order order) async {
    try {
      int? newId = await _remoteDatabaseService.createOrder(order);
      final newOrder = order.copyWith(id: newId);
      _databaseService.insertOrder(newOrder);

      state = [...state, newOrder];

      return newId;
    } catch (e, st) {
      _talker.error('Error saving an order - ', e, st);
      return null;
    }
  }

  Future<void> updateOrder(Order order) async {
    try {
      await _remoteDatabaseService.updateOrder(order);
      await _databaseService.updateOrder(order);

      state = state..removeWhere((item) => item.id == order.id);
      state = [...state, order];
    } catch (e, st) {
      _talker.error('Error updating an order - ', e, st);
    }
  }

  Future<void> deleteOrder(int id) async {
    try {
      await _remoteDatabaseService.deleteOrder(id);
      await _databaseService.deleteOrder(id);

      state = state.where((item) => item.id != id).toList();
    } catch (e, st) {
      _talker.error('Error deleting an order - ', e, st);
    }
  }

  Future<void> getStopLossNotifications(
    FirebaseMessagingNotification firebaseMessagingNotification,
  ) async {
    try {
      await _remoteDatabaseService.getStopLossNotifications(firebaseMessagingNotification);
    } catch (e, st) {
      _talker.error('Error getting stop loss notifications - ', e, st);
    }
  }
}
