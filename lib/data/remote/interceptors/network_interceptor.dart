import 'package:crypter/data/extensions/dio_extensions.dart';
import 'package:crypter/data/remote/app_exception.dart';
import 'package:crypter/domain/services/remote/network_service.dart';
import 'package:dio/dio.dart';
import 'package:talker/talker.dart';

class NetworkInterceptor extends Interceptor {
  final NetworkService _networkService;
  final Talker _talker;

  NetworkInterceptor(this._networkService, this._talker);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    err.logException(_talker);
    handler.reject(err.copyWith(error: err.mapDioExceptionTypeToAppException()));
  }

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!await _networkService.isConnected) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: NetworkException.noInternet(),
          type: DioExceptionType.connectionError,
        ),
      );
    } else {
      handler.next(options);
    }
  }
}
