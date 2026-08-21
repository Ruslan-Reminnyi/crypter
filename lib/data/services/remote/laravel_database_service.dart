import 'dart:async';
import 'package:crypter/data/models/firebase_messaging_notification/firebase_messaging_notification.dart';
import 'package:crypter/data/models/order/order.dart';
import 'package:crypter/data/remote/api_endpoints.dart';
import 'package:crypter/domain/services/local/local_storage_service.dart';
import 'package:crypter/domain/services/remote/remote_database_service.dart';
import 'package:dio/dio.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class LaravelDatabaseService implements RemoteDatabaseService {
  final Dio _dio;
  final LocalStorageService _sharedPreferencesService;
  final Talker _talker;

  LaravelDatabaseService(this._dio, this._sharedPreferencesService, this._talker) {
    _dio.interceptors.add(
      TalkerDioLogger(
        talker: _talker,
        settings: TalkerDioLoggerSettings(printResponseHeaders: true),
      ),
    );
  }

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

      _talker.info('Got all orders');

      return response.data['data'].map<Order>((item) => Order.fromJson(item)).toList();
    } on DioException catch (e, st) {
      if (e.type == DioExceptionType.connectionError) {
        _talker.warning('Server is not working - $e');
      } else if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        _talker.warning('Encountering a timeout');
      } else {
        _talker.critical('Error getting all orders from the server - ', e.error, st);
      }
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

      _talker.info('Created an order on the server');

      return response.data['data']['id'];
    } on DioException catch (e, st) {
      if (e.type == DioExceptionType.connectionError) {
        _talker.warning('Server is not working - $e');
      } else if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        _talker.warning('Encountering a timeout');
      } else {
        _talker.critical('Error creating an order on the server - ', e.error, st);
      }
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

      _talker.info('Got an order from the server');

      return Order.fromJson(response.data['data']);
    } on DioException catch (e, st) {
      if (e.type == DioExceptionType.connectionError) {
        _talker.warning('Server is not working - $e');
      } else if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        _talker.warning('Encountering a timeout');
      } else {
        _talker.critical('Error getting an order from the server - ', e.error, st);
      }
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

      _talker.info('Updated an order on the server');
    } on DioException catch (e, st) {
      if (e.type == DioExceptionType.connectionError) {
        _talker.warning('Server is not working - $e');
      } else if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        _talker.warning('Encountering a timeout');
      } else {
        _talker.critical('Error updating an order on the server - ', e.error, st);
      }
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

      _talker.info('Deleted an order from the server');
    } on DioException catch (e, st) {
      if (e.type == DioExceptionType.connectionError) {
        _talker.warning('Server is not working - $e');
      } else if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        _talker.warning('Encountering a timeout');
      } else {
        _talker.critical('Error deleting an order from the server - ', e.error, st);
      }
    }
  }

  @override
  Future<void> getStopLossNotifications(
    FirebaseMessagingNotification firebaseMessagingNotification,
  ) async {
    try {
      await _dio.post(
        ApiEndpoints.notifications.firebaseMessaging,
        data: firebaseMessagingNotification
            .copyWith(firebaseMessagingToken: _sharedPreferencesService.firebaseMessagingToken)
            .toJson(),
        options: Options(
          headers: {'Authorization': 'Bearer $_token', 'Accept': 'application/json'},
        ),
      );

      _talker.info('Got Stop Loss notifications');
    } on DioException catch (e, st) {
      if (e.type == DioExceptionType.connectionError) {
        _talker.warning('Server is not working - $e');
      } else if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        _talker.warning('Encountering a timeout');
      } else {
        _talker.critical(
          'Error an attempt to get Stop Loss notifications from the server - ',
          e.error,
          st,
        );
      }
    }
  }
}
