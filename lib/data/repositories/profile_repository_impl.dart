import 'package:crypter/data/models/backend_user/backend_user.dart';
import 'package:crypter/data/remote/api_endpoints.dart';
import 'package:crypter/domain/repositories/profile_repository.dart';
import 'package:crypter/domain/services/local/local_storage_service.dart';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker/talker.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final Dio _dio;
  final LocalStorageService _sharedPreferencesService;
  final Talker _talker;

  ProfileRepositoryImpl(this._dio, this._sharedPreferencesService, this._talker) {
    _dio.interceptors.add(
      TalkerDioLogger(
        talker: _talker,
        settings: TalkerDioLoggerSettings(printResponseHeaders: true),
      ),
    );
  }

  String? get _token => _sharedPreferencesService.token;

  @override
  Future<BackendUser?> getBackendUser() async {
    try {
      final response = await _dio.get(
        ApiEndpoints.users.user,
        options: Options(
          headers: {'Authorization': 'Bearer $_token', 'Accept': 'application/json'},
        ),
      );

      _talker.info('Got the backend user');

      return BackendUser.fromJson(response.data['user']);
    } on DioException catch (e, st) {
      if (e.type == DioExceptionType.connectionError) {
        _talker.warning('Server is not working - $e');
      } else if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        _talker.warning('Encountering a timeout');
      } else {
        _talker.critical('Error getting the backend user - ', e.error, st);
      }
      return null;
    }
  }
}
