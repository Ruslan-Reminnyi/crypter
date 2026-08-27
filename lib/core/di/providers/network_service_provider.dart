part of 'package:crypter/core/di/providers/app_providers.dart';

@riverpod
NetworkService networkService(Ref _) => NetworkServiceImpl(Connectivity());
