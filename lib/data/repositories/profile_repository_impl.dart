import 'package:crypter/data/models/backend_user/backend_user.dart';
import 'package:crypter/data/remote/api_endpoints.dart';
import 'package:crypter/domain/repositories/profile_repository.dart';
import 'package:crypter/domain/services/local/local_storage_service.dart';
import 'package:dio/dio.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final Dio _dio;
  final LocalStorageService _sharedPreferencesService;

  ProfileRepositoryImpl(this._dio, this._sharedPreferencesService);

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

      return BackendUser.fromJson(response.data['user']);
    } on DioException {
      return null;
    }
  }
}
