import 'package:crypter/domain/services/local/local_storage_service.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final LocalStorageService _sharedPreferences;

  AuthInterceptor(this._sharedPreferences);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final isAuthRequired = options.extra['isAuthRequired'] ?? true;

    if (isAuthRequired) {
      final token = _sharedPreferences.token;
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}
