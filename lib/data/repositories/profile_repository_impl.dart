import 'package:crypter/data/models/backend_user/backend_user.dart';
import 'package:crypter/data/remote/api_endpoints.dart';
import 'package:crypter/domain/repositories/profile_repository.dart';
import 'package:dio/dio.dart';
import 'package:talker/talker.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final Dio _dio;
  final Talker _talker;

  ProfileRepositoryImpl(this._dio, this._talker);

  @override
  Future<BackendUser?> getBackendUser() async {
    final response = await _dio.get(ApiEndpoints.users.user);

    _talker.info('Got the backend user');

    return BackendUser.fromJson(response.data['user']);
  }
}
