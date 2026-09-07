import 'package:crypter/core/di/providers/app_providers.dart';
import 'package:crypter/data/models/order/order.dart';
import 'package:crypter/domain/services/local/local_database_service.dart';
import 'package:crypter/domain/services/remote/remote_database_service.dart';
import 'package:crypter/presentation/features/orders/notifiers/orders_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker/talker.dart';

part 'orders_notifier.g.dart';

@riverpod
class OrdersNotifier extends _$OrdersNotifier {
  LocalDatabaseService get _databaseService => ref.read(sqfliteServiceProvider);
  RemoteDatabaseService get _remoteDatabaseService => ref.read(laravelDatabaseServiceProvider);
  Talker get _talker => ref.read(talkerProvider);

  @override
  OrdersState build() {
    _getInitialState();

    return const OrdersState(isLoading: true);
  }

  Future<void> _getInitialState() async {
    try {
      final allOrdersFromRemoteDb = await _remoteDatabaseService.getAllOrders();
      state = state.copyWith(isLoading: false, orders: allOrdersFromRemoteDb);
    } catch (remoteError, remoteStackTrace) {
      _talker.error('Error getting all orders from remote DB - ', remoteError, remoteStackTrace);

      try {
        final allOrdersFromLocalDb = await _databaseService.getAllOrders();
        state = state.copyWith(isLoading: false, orders: allOrdersFromLocalDb);
      } catch (localError, localStackTrace) {
        _talker.error('Error getting all orders from local DB - ', localError, localStackTrace);

        state = state.copyWith(
          isLoading: false,
          orders: [],
          error: 'Error getting all orders - $localError\n$localStackTrace',
        );
      }
    }
  }

  Future<int?> saveOrder(Order order) async {
    state = state.copyWith(isLoading: true);
    try {
      int? newId = await _remoteDatabaseService.createOrder(order);
      final newOrder = order.copyWith(id: newId);
      _databaseService.insertOrder(newOrder);

      state = state.copyWith(isLoading: false, orders: [...state.orders, newOrder]);

      return newId;
    } catch (e, st) {
      _talker.error('Error saving an order - ', e, st);
      state = state.copyWith(
        isLoading: false,
        orders: [],
        error: 'Error getting all orders - $e\n$st',
      );
      return null;
    }
  }

  Future<void> updateOrder(Order order) async {
    state = state.copyWith(isLoading: true);
    try {
      await _remoteDatabaseService.updateOrder(order);
      await _databaseService.updateOrder(order);

      final updatedList = [...state.orders.where((item) => item.id != order.id), order];

      state = state.copyWith(isLoading: false, orders: updatedList);
    } catch (e, st) {
      _talker.error('Error updating an order - ', e, st);
      state = state.copyWith(
        isLoading: false,
        orders: [],
        error: 'Error getting all orders - $e\n$st',
      );
    }
  }

  Future<void> deleteOrder(int id) async {
    state = state.copyWith(isLoading: true);
    try {
      await _remoteDatabaseService.deleteOrder(id);
      await _databaseService.deleteOrder(id);

      final updatedList = state.orders.where((item) => item.id != id).toList();

      state = state.copyWith(isLoading: false, orders: updatedList);
    } catch (e, st) {
      _talker.error('Error deleting an order - ', e, st);
      state = state.copyWith(
        isLoading: false,
        orders: [],
        error: 'Error getting all orders - $e\n$st',
      );
    }
  }
}
