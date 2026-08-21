part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
LocalDatabaseService sqfliteService(Ref ref) {
  return SqfliteService(ref.watch(sqfliteProvider), ref.watch(talkerProvider));
}
