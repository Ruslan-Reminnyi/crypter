import 'package:crypter/data/remote/api_endpoints.dart';
import 'package:crypter/domain/repositories/auth_repository.dart';
import 'package:crypter/domain/services/local/local_storage_service.dart';

import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  final LocalStorageService _sharedPreferencesService;

  AuthRepositoryImpl(this._dio, this._sharedPreferencesService);

  @override
  bool get isLoggedIn => _token != null && _token != '';

  String? get _token => _sharedPreferencesService.token;

  @override
  Future<String> register(String name, String email, String password, String deviceName) async {
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

      return token;
    } on DioException catch (e, st) {
      return 'Error registering a user - $e\n$st';
    }
  }

  @override
  Future<String> login(String email, String password, String deviceName) async {
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

      return token;
    } on DioException catch (e, st) {
      return 'Error logining a user - $e\n$st';
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await _dio.post(
        ApiEndpoints.auth.logout,
        options: Options(
          headers: {'Authorization': 'Bearer $_token', 'Accept': 'application/json'},
        ),
      );

      _sharedPreferencesService.setToken('');

      return true;
    } on DioException {
      return false;
    }
  }
}
