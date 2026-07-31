import 'dart:async';
import 'dart:io';

import 'package:crypter/data/models/order/order.dart';
import 'package:crypter/data/remote/api_endpoints.dart';
import 'package:crypter/domain/services/local/local_storage_service.dart';
import 'package:crypter/domain/services/remote/remote_database_service.dart';
import 'package:dio/dio.dart';

class LaravelDatabaseService implements RemoteDatabaseService {
  final Dio _dio;
  final LocalStorageService _sharedPreferencesService;

  LaravelDatabaseService(this._dio, this._sharedPreferencesService);

  String? get _token => _sharedPreferencesService.token;

  @override
  Future<List<Order>> getAllOrders() async {
    try {
      final response = await _dio.get(
        ApiEndpoints.database.orders,
        options: Options(
          headers: {'Authorization': 'Bearer $_token', 'Accept': 'application/json'},
        ),
      );
      return response.data['data'].map<Order>((item) => Order.fromJson(item)).toList();
    } on DioException catch (e, st) {
      return [];
    }
  }

  @override
  Future<int> createOrder(Order order) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.database.orders,
        data: order.toJson(),
        options: Options(
          headers: {'Authorization': 'Bearer $_token', 'Accept': 'application/json'},
        ),
      );
      return response.data['data']['id'];
    } on DioException catch (e, st) {
      return 0;
    }
  }

  @override
  Future<Order> getOrder(int id) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.database.orderById(id),
        options: Options(
          headers: {'Authorization': 'Bearer $_token', 'Accept': 'application/json'},
        ),
      );
      return Order.fromJson(response.data['data']);
    } on DioException catch (e, st) {
      rethrow;
    }
  }

  @override
  Future<void> updateOrder(Order order) async {
    try {
      await _dio.put(
        ApiEndpoints.database.orderById(order.id!),
        data: order.toJson(),
        options: Options(
          headers: {'Authorization': 'Bearer $_token', 'Accept': 'application/json'},
        ),
      );
    } on DioException catch (e, st) {
      return;
    }
  }

  @override
  Future<void> deleteOrder(int id) async {
    try {
      await _dio.delete(
        ApiEndpoints.database.orderById(id),
        options: Options(
          headers: {'Authorization': 'Bearer $_token', 'Accept': 'application/json'},
        ),
      );
    } on DioException catch (e, st) {
      return;
    }
  }

  @override
  Future<void> listenToNotifications({
    int? orderId,
    double stopLoss = 0.0,
    required String symbol,
  }) async {
    try {
      await _dio.post(
        '/api/v1/fcm-notification',
        data: {
          'order_id': orderId,
          'platform': Platform.operatingSystem,
          'fcm_token': _sharedPreferencesService.firebaseMessagingToken,
          'stop_loss': stopLoss,
          'symbol': symbol,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $_token', 'Accept': 'application/json'},
        ),
      );
    } on DioException catch (e, st) {
      return;
    }
  }
}
