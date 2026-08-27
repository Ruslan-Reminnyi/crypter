import 'package:crypter/data/remote/app_exception.dart';
import 'package:dio/dio.dart';
import 'package:talker/talker.dart';

extension DioExceptionsType on DioException {
  AppException mapDioExceptionTypeToAppException() {
    return switch (type) {
      .connectionTimeout || .receiveTimeout || .sendTimeout => NetworkException.timeout(),
      .connectionError => NetworkException.noInternet(),
      .badResponse => _handleBadResponse(),
      .badCertificate => UnknownException('SSL error'),
      _ => UnknownException(message ?? 'Unknown exception', error),
    };
  }

  AppException _handleBadResponse() {
    final statusCode = response?.statusCode;

    switch (statusCode) {
      case 401:
        return ServerException.unauthorized();
      case 403:
        return ServerException.forbidden();
      default:
        final (message, errors) = _parseServerError(response?.data);
        return ServerException.payload(
          message: message ?? _getFallbackMessageByStatusCode(statusCode),
          statusCode: statusCode,
          errors: errors,
        );
    }
  }

  (String?, Map<String, dynamic>?) _parseServerError(dynamic data) {
    return switch (data) {
      {'message': String message, 'errors': Map<String, dynamic> errors} => (message, errors),
      {'message': List<dynamic> message} => (message.join('\n'), null),
      {'message': String message} ||
      {'error': String message} ||
      {'detail': String message} ||
      {'title': String message} => (message, null),
      String text when text.isNotEmpty => (text, null),
      _ => (null, null),
    };
  }

  String _getFallbackMessageByStatusCode(int? statusCode) {
    return switch (statusCode) {
      400 => 'Request is invalid',
      404 => 'Resource not found',
      422 => 'Data validation error',
      500 => 'Internal server error',
      502 || 503 || 504 => 'Server is temporarily unavailable',
      _ => 'Server error $statusCode',
    };
  }

  void logException(Talker talker) => switch (mapDioExceptionTypeToAppException()) {
    NetworkException(errorType: NetworkErrorType.timeout) => talker.warning(
      'Encountering a timeout',
    ),
    NetworkException(errorType: NetworkErrorType.noInternet) => talker.warning(
      'No internet connection',
    ),
    ServerException(statusCode: 401) => talker.warning('Unauthorized user'),
    ServerException(statusCode: 403) => talker.warning('Access is forbidden'),
    ServerException(:final message, :final statusCode, :final errors) => talker.critical(
      'Server error $statusCode - $message,\n$errors',
      error,
    ),
    UnknownException(:final message, :final error) => talker.critical('Error - $message', error),
  };
}
