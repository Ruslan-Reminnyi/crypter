import 'package:crypter/data/remote/api_endpoints.dart';
import 'package:crypter/domain/repositories/auth_repository.dart';
import 'package:crypter/domain/services/local/local_storage_service.dart';
import 'package:dio/dio.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  final LocalStorageService _sharedPreferencesService;
  final Talker _talker;

  AuthRepositoryImpl(this._dio, this._sharedPreferencesService, this._talker) {
    _dio.interceptors.add(
      TalkerDioLogger(
        talker: _talker,
        settings: TalkerDioLoggerSettings(printResponseHeaders: true),
      ),
    );
  }

  @override
  bool get isLoggedIn => _token != null && _token != '';

  String? get _token => _sharedPreferencesService.token;

  @override
  Future<void> register(String name, String email, String password, String deviceName) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.auth.register,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': password,
          'device_name': deviceName,
        },
      );
      final token = response.data['token'];

      _sharedPreferencesService.setToken(token);

      _talker.info('Registered with token - $token');
    } on DioException catch (e, st) {
      if (e.type == DioExceptionType.connectionError) {
        _talker.warning('Server is not working - $e');
      } else if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        _talker.warning('Encountering a timeout');
      } else {
        _talker.critical('Error registering a user -', e.error, st);
      }
    }
  }

  @override
  Future<void> login(String email, String password, String deviceName) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.auth.login,
        data: {
          'email': email,
          'password': password,
          'password_confirmation': password,
          'device_name': deviceName,
        },
      );
      final token = response.data['token'];

      _sharedPreferencesService.setToken(token);

      _talker.info('Logged in with token - $token');
    } on DioException catch (e, st) {
      if (e.type == DioExceptionType.connectionError) {
        _talker.warning('Server is not working - $e');
      } else if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        _talker.warning('Encountering a timeout');
      } else {
        _talker.critical('Error logining a user - ', e.error, st);
      }
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _dio.post(
        ApiEndpoints.auth.logout,
        options: Options(
          headers: {'Authorization': 'Bearer $_token', 'Accept': 'application/json'},
        ),
      );

      _sharedPreferencesService.setToken('');

      _talker.info('Logged out');
    } on DioException catch (e, st) {
      if (e.type == DioExceptionType.connectionError) {
        _talker.warning('Server is not working - $e');
      } else if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        _talker.warning('Encountering a timeout');
      } else {
        _talker.critical('Error log outing a user - ', e.error, st);
      }
    }
  }
}
