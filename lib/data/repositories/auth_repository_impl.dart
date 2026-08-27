import 'package:crypter/data/remote/api_endpoints.dart';
import 'package:crypter/domain/repositories/auth_repository.dart';
import 'package:crypter/domain/services/local/local_storage_service.dart';
import 'package:dio/dio.dart';
import 'package:talker/talker.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  final LocalStorageService _sharedPreferencesService;
  final Talker _talker;

  AuthRepositoryImpl(this._dio, this._sharedPreferencesService, this._talker);

  @override
  bool get isLoggedIn => _token != null && _token != '';

  String? get _token => _sharedPreferencesService.token;

  @override
  Future<void> register(String name, String email, String password, String deviceName) async {
    final response = await _dio.post(
      ApiEndpoints.auth.register,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password,
        'device_name': deviceName,
      },
      options: Options(extra: {'isAuthRequired': false}),
    );
    final token = response.data['token'];

    _sharedPreferencesService.setToken(token);

    _talker.info('Registered with token - $token');
  }

  @override
  Future<void> login(String email, String password, String deviceName) async {
    final response = await _dio.post(
      ApiEndpoints.auth.login,
      data: {
        'email': email,
        'password': password,
        'password_confirmation': password,
        'device_name': deviceName,
      },
      options: Options(extra: {'isAuthRequired': false}),
    );
    final token = response.data['token'];

    _sharedPreferencesService.setToken(token);

    _talker.info('Logged in with token - $token');
  }

  @override
  Future<void> logout() async {
    await _dio.post(ApiEndpoints.auth.logout);

    _sharedPreferencesService.setToken('');

    _talker.info('Logged out');
  }
}
