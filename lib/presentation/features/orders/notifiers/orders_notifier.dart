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

  void _getInitialState() {
    _remoteDatabaseService
        .getAllOrders()
        .then((items) {
          if (items.isNotEmpty) {
            state = items;
          } else {
            _databaseService.getAllOrders().then((items) => state = items).catchError((error) {
              _talker.error('Error getting all orders from Sqflite');
              return state;
            });
          }
        })
        .catchError((error) {
          _talker.error('Error getting all orders from Laravel');
        });
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

  void updateOrder(Order order) {
    _remoteDatabaseService
        .updateOrder(order)
        .then((_) {
          _databaseService
              .updateOrder(order)
              .then((_) {
                state = state..removeWhere((item) => item.id == order.id);
                state = [...state, order];
              })
              .catchError((error) {
                _talker.error('Error updating an order in Sqflite - ', error);
              });
        })
        .catchError((error) {
          _talker.error('Error updating an order in Laravel - ', error);
        });
  }

  void deleteOrder(int id) {
    _remoteDatabaseService
        .deleteOrder(id)
        .then((_) {
          _databaseService
              .deleteOrder(id)
              .then((_) => state = state.where((item) => item.id != id).toList())
              .catchError((error) {
                _talker.error('Error deleting an order from Sqflite - ', error);
                return state;
              });
        })
        .catchError((error) {
          _talker.error('Error deleting an order from Laravel - ', error);
        });
  }

  void getStopLossNotifications(FirebaseMessagingNotification firebaseMessagingNotification) =>
      _remoteDatabaseService.getStopLossNotifications(firebaseMessagingNotification);
}
