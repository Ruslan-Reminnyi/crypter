part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
LocalDatabaseService sqfliteService(Ref ref) {
  final sqflite = ref.watch(sqfliteProvider);
  return SqfliteService(sqflite);
}
