import 'dart:async';
import 'package:crypter/data/models/firebase_messaging_notification/firebase_messaging_notification.dart';
import 'package:crypter/data/models/order/order.dart';
import 'package:crypter/data/remote/api_endpoints.dart';
import 'package:crypter/domain/services/local/local_storage_service.dart';
import 'package:crypter/domain/services/remote/remote_database_service.dart';
import 'package:dio/dio.dart';
import 'package:talker/talker.dart';

class LaravelDatabaseService implements RemoteDatabaseService {
  final Dio _dio;
  final LocalStorageService _sharedPreferencesService;
  final Talker _talker;

  LaravelDatabaseService(this._dio, this._sharedPreferencesService, this._talker);

  @override
  Future<List<Order>> getAllOrders() async {
    final response = await _dio.get(ApiEndpoints.database.orders);

    _talker.info('Got all orders');

    return response.data['data'].map<Order>((item) => Order.fromJson(item)).toList();
  }

  @override
  Future<int> createOrder(Order order) async {
    final response = await _dio.post(ApiEndpoints.database.orders, data: order.toJson());

    _talker.info('Created an order on the server');

    return response.data['data']['id'];
  }

  @override
  Future<Order> getOrder(int id) async {
    final response = await _dio.get(ApiEndpoints.database.orderById(id));

    _talker.info('Got an order from the server');

    return Order.fromJson(response.data['data']);
  }

  @override
  Future<void> updateOrder(Order order) async {
    await _dio.put(ApiEndpoints.database.orderById(order.id!), data: order.toJson());

    _talker.info('Updated an order on the server');
  }

  @override
  Future<void> deleteOrder(int id) async {
    await _dio.delete(ApiEndpoints.database.orderById(id));

    _talker.info('Deleted an order from the server');
  }

  @override
  Future<void> getStopLossNotifications(
    FirebaseMessagingNotification firebaseMessagingNotification,
  ) async {
    await _dio.post(
      ApiEndpoints.notifications.firebaseMessaging,
      data: firebaseMessagingNotification
          .copyWith(firebaseMessagingToken: _sharedPreferencesService.firebaseMessagingToken)
          .toJson(),
    );

    _talker.info('Got Stop Loss notifications');
  }
}
