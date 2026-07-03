import 'package:crypter/core/di/providers/app_providers.dart';
import 'package:crypter/data/models/order/order.dart';
import 'package:crypter/domain/services/local/local_database_service.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orders_notifier.g.dart';

@riverpod
class OrdersNotifier extends _$OrdersNotifier {
  LocalDatabaseService get _databaseService => ref.read(sqfliteServiceProvider);

  @override
  List<Order> build() {
    _getInitialState();
    return [];
  }

  void _getInitialState() {
    _databaseService.getAll().then((items) => state = items);
  }

  void saveOrder(Order order) {
    _databaseService
        .insert(order)
        .then((newId) {
          final newOrder = order.copyWith(id: newId);
          state = [...state, newOrder];
        })
        .catchError((error) {
          debugPrint('Error saving an order - $error');
        });
  }

  void updateOrder(Order order) {
    _databaseService
        .update(order)
        .then((_) {
          state = state..removeWhere((item) => item.id == order.id);
          state = [...state, order];
        })
        .catchError((error) {
          debugPrint('Error updating an order - $error');
        });
  }

  void deleteOrder(int id) {
    _databaseService
        .delete(id)
        .then((_) => state = state.where((item) => item.id != id).toList())
        .catchError((error) {
          debugPrint('Error deleting an order - $error');
          return state;
        });
  }
}
