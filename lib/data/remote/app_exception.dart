sealed class AppException implements Exception {}

enum NetworkErrorType { noInternet, timeout }

class NetworkException extends AppException {
  final NetworkErrorType errorType;

  NetworkException.timeout() : errorType = NetworkErrorType.timeout;

  NetworkException.noInternet() : errorType = NetworkErrorType.noInternet;
}

class ServerException extends AppException {
  final String message;
  final int? statusCode;
  final Map<String, dynamic>? errors;

  ServerException.unauthorized() : message = 'Unauthorized user', statusCode = 401, errors = null;

  ServerException.forbidden() : message = 'Access is forbidden', statusCode = 403, errors = null;

  ServerException.payload({required this.message, this.statusCode, this.errors});
}

class UnknownException extends AppException {
  final String message;
  final Object? error;

  UnknownException([this.message = 'Unknown exception', this.error]);
}
