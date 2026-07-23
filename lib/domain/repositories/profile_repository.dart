import 'package:crypter/data/models/backend_user/backend_user.dart';

abstract interface class ProfileRepository {
  Future<BackendUser?> getBackendUser();
}
