import 'package:crypter/core/app/config/app_config.dart';

/// API Endpoints
// usage example: ApiEndpoints.auth.login
class ApiEndpoints {
  static final auth = _AuthEndpoints();
  static final users = _UsersEndpoints();
  static final database = _DatabaseEndpoints();
  static final ai = _AIEndpoints();
  static final notifications = _NotificationsEndpoints();
}

enum _ApiVersion {
  v1('/api/v1');

  final String path;

  const _ApiVersion(this.path);
}

abstract interface class _EndpointModule {}

class _AuthEndpoints extends _EndpointModule {
  String get register => '${_ApiVersion.v1.path}/register';

  String get login => '${_ApiVersion.v1.path}/login';

  String get logout => '${_ApiVersion.v1.path}/logout';
}

class _UsersEndpoints extends _EndpointModule {
  String get user => '${_ApiVersion.v1.path}/user';
}

class _DatabaseEndpoints extends _EndpointModule {
  String get _path => 'orders';

  String get orders => '${_ApiVersion.v1.path}/$_path';

  String orderById(int id) => '${_ApiVersion.v1.path}/$_path/$id';
}

class _AIEndpoints extends _EndpointModule {
  String get _path => 'ai';

  String get host => AppConfig.fromEnvironment().apiBaseUrl;

  String get orderCreationRecommendations =>
      '$host${_ApiVersion.v1.path}/$_path/order-creation-recommendations';
}

class _NotificationsEndpoints extends _EndpointModule {
  String get firebaseMessaging => '${_ApiVersion.v1.path}/fcm-notification';
}
