// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:candlesticks/candlesticks.dart' as _i940;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rxdart/rxdart.dart' as _i430;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:web_socket_channel/web_socket_channel.dart' as _i525;

import '../../data/repositories/binance_crypto_info_repo.dart' as _i694;
import '../../data/services/local/shared_preferences_service.dart' as _i183;
import '../../data/services/remote/binance_web_socket_service.dart' as _i702;
import '../../domain/repositories/crypto_info_repo.dart' as _i907;
import '../../domain/services/local/local_storage_service.dart' as _i971;
import '../../domain/services/remote/web_socket_service.dart' as _i300;
import 'modules/app_module.dart' as _i349;
import 'modules/config_module.dart' as _i810;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $configure(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final appModule = _$AppModule();
  final appConfigModule = _$AppConfigModule();
  await gh.singletonAsync<_i460.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i525.WebSocketChannel>(() => appModule.webSocketChannel);
  gh.lazySingleton<_i430.BehaviorSubject<List<_i940.Candle>>>(
    () => appModule.behaviourSubject,
  );
  gh.factory<String>(
    () => appConfigModule.binanceApiBaseUrl,
    instanceName: 'apiBaseUrl',
  );
  gh.lazySingleton<_i300.WebSocketService>(
    () => _i702.BinanceWebSocketService(gh<_i525.WebSocketChannel>()),
  );
  gh.lazySingleton<_i361.Dio>(
    () => appModule.dio(gh<String>(instanceName: 'apiBaseUrl')),
  );
  gh.singleton<_i971.LocalStorageService>(
    () => _i183.SharedPreferencesService(gh<_i460.SharedPreferences>()),
  );
  gh.lazySingleton<_i907.CryptoInfoRepo>(
    () => _i694.BinanceCryptoInfoRepo(
      gh<_i361.Dio>(),
      gh<_i300.WebSocketService>(),
      gh<_i430.BehaviorSubject<List<_i940.Candle>>>(),
    ),
  );
  return getIt;
}

class _$AppModule extends _i349.AppModule {}

class _$AppConfigModule extends _i810.AppConfigModule {}
