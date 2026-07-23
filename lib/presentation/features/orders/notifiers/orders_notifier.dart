import 'package:crypter/core/di/providers/app_providers.dart';
import 'package:crypter/data/models/order/order.dart';
import 'package:crypter/domain/services/local/local_database_service.dart';
import 'package:crypter/domain/services/remote/remote_database_service.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orders_notifier.g.dart';

@riverpod
class OrdersNotifier extends _$OrdersNotifier {
  LocalDatabaseService get _databaseService => ref.read(sqfliteServiceProvider);

  RemoteDatabaseService get _remoteDatabaseService => ref.watch(laravelDatabaseServiceProvider);

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
              debugPrint('Error getting all orders from sqflite');
              return state;
            });
          }
        })
        .catchError((error) {
          debugPrint('Error getting all orders from laravel');
        });
  }

  void saveOrder(Order order) {
    _remoteDatabaseService
        .createOrder(order)
        .then((newId) {
          final newOrder = order.copyWith(id: newId);

          _databaseService
              .insertOrder(newOrder)
              .then((_) {
                state = [...state, newOrder];
              })
              .catchError((error) {
                debugPrint('Error saving an order to sqflite - $error');
              });
        })
        .catchError((error) {
          debugPrint('Error saving an order to laravel - $error');
        });
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
                debugPrint('Error updating an order in sqflite - $error');
              });
        })
        .catchError((error) {
          debugPrint('Error updating an order in laravel - $error');
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
                debugPrint('Error deleting an order from sqflite - $error');
                return state;
              });
        })
        .catchError((error) {
          debugPrint('Error deleting an order from laravel - $error');
        });
  }
}
