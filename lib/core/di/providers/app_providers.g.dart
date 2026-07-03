// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cryptoInfoRepository)
final cryptoInfoRepositoryProvider = CryptoInfoRepositoryProvider._();

final class CryptoInfoRepositoryProvider
    extends
        $FunctionalProvider<
          CryptoInfoRepository,
          CryptoInfoRepository,
          CryptoInfoRepository
        >
    with $Provider<CryptoInfoRepository> {
  CryptoInfoRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cryptoInfoRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cryptoInfoRepositoryHash();

  @$internal
  @override
  $ProviderElement<CryptoInfoRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CryptoInfoRepository create(Ref ref) {
    return cryptoInfoRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CryptoInfoRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CryptoInfoRepository>(value),
    );
  }
}

String _$cryptoInfoRepositoryHash() =>
    r'44ac9380591b1ebc9ef1ce32cc21f3738ac539a2';

@ProviderFor(binanceWebSocketService)
final binanceWebSocketServiceProvider = BinanceWebSocketServiceProvider._();

final class BinanceWebSocketServiceProvider
    extends
        $FunctionalProvider<
          WebSocketService,
          WebSocketService,
          WebSocketService
        >
    with $Provider<WebSocketService> {
  BinanceWebSocketServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'binanceWebSocketServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$binanceWebSocketServiceHash();

  @$internal
  @override
  $ProviderElement<WebSocketService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WebSocketService create(Ref ref) {
    return binanceWebSocketService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WebSocketService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WebSocketService>(value),
    );
  }
}

String _$binanceWebSocketServiceHash() =>
    r'ad0fb25f1c487f2732983d979f5e6fbf32c76f12';

@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider
    extends
        $FunctionalProvider<
          SharedPreferences,
          SharedPreferences,
          SharedPreferences
        >
    with $Provider<SharedPreferences> {
  SharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  $ProviderElement<SharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferences create(Ref ref) {
    return sharedPreferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferences>(value),
    );
  }
}

String _$sharedPreferencesHash() => r'60288ca1ce4af1c804cf7ab08dfdf385a74937ef';

@ProviderFor(binanceApiBaseUrl)
final binanceApiBaseUrlProvider = BinanceApiBaseUrlProvider._();

final class BinanceApiBaseUrlProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  BinanceApiBaseUrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'binanceApiBaseUrlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$binanceApiBaseUrlHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return binanceApiBaseUrl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$binanceApiBaseUrlHash() => r'1692c2ce987f08670024ab3fd0603c816cc4d97d';

@ProviderFor(behaviourSubject)
final behaviourSubjectProvider = BehaviourSubjectProvider._();

final class BehaviourSubjectProvider
    extends
        $FunctionalProvider<
          BehaviorSubject<List<Candle>>,
          BehaviorSubject<List<Candle>>,
          BehaviorSubject<List<Candle>>
        >
    with $Provider<BehaviorSubject<List<Candle>>> {
  BehaviourSubjectProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'behaviourSubjectProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$behaviourSubjectHash();

  @$internal
  @override
  $ProviderElement<BehaviorSubject<List<Candle>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BehaviorSubject<List<Candle>> create(Ref ref) {
    return behaviourSubject(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BehaviorSubject<List<Candle>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BehaviorSubject<List<Candle>>>(
        value,
      ),
    );
  }
}

String _$behaviourSubjectHash() => r'877e55b6192e72b8eac3a6b3e91e4af9b799444e';

@ProviderFor(dio)
final dioProvider = DioProvider._();

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'5fef88fcf45aeb332fac48ad9fc6e00b984f6cda';

@ProviderFor(webSocketChannel)
final webSocketChannelProvider = WebSocketChannelProvider._();

final class WebSocketChannelProvider
    extends
        $FunctionalProvider<
          WebSocketChannel,
          WebSocketChannel,
          WebSocketChannel
        >
    with $Provider<WebSocketChannel> {
  WebSocketChannelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'webSocketChannelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$webSocketChannelHash();

  @$internal
  @override
  $ProviderElement<WebSocketChannel> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WebSocketChannel create(Ref ref) {
    return webSocketChannel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WebSocketChannel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WebSocketChannel>(value),
    );
  }
}

String _$webSocketChannelHash() => r'bbcc5df83f96ec3be856bab0a99083150eba94c0';

@ProviderFor(sharedPreferencesService)
final sharedPreferencesServiceProvider = SharedPreferencesServiceProvider._();

final class SharedPreferencesServiceProvider
    extends
        $FunctionalProvider<
          LocalStorageService,
          LocalStorageService,
          LocalStorageService
        >
    with $Provider<LocalStorageService> {
  SharedPreferencesServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesServiceHash();

  @$internal
  @override
  $ProviderElement<LocalStorageService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalStorageService create(Ref ref) {
    return sharedPreferencesService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalStorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalStorageService>(value),
    );
  }
}

String _$sharedPreferencesServiceHash() =>
    r'30733c76b97f80d36bd6514e3462803a532fff62';

@ProviderFor(router)
final routerProvider = RouterProvider._();

final class RouterProvider
    extends $FunctionalProvider<AppRouter, AppRouter, AppRouter>
    with $Provider<AppRouter> {
  RouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routerHash();

  @$internal
  @override
  $ProviderElement<AppRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppRouter create(Ref ref) {
    return router(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppRouter>(value),
    );
  }
}

String _$routerHash() => r'2ee7b6c1055e3c0a42917025428037278a4bd6fb';

@ProviderFor(sqflite)
final sqfliteProvider = SqfliteProvider._();

final class SqfliteProvider
    extends $FunctionalProvider<Database, Database, Database>
    with $Provider<Database> {
  SqfliteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sqfliteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sqfliteHash();

  @$internal
  @override
  $ProviderElement<Database> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Database create(Ref ref) {
    return sqflite(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Database value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Database>(value),
    );
  }
}

String _$sqfliteHash() => r'38a117e2861208f8caee37b9ed7503003070d7ee';

@ProviderFor(sqfliteService)
final sqfliteServiceProvider = SqfliteServiceProvider._();

final class SqfliteServiceProvider
    extends
        $FunctionalProvider<
          LocalDatabaseService,
          LocalDatabaseService,
          LocalDatabaseService
        >
    with $Provider<LocalDatabaseService> {
  SqfliteServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sqfliteServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sqfliteServiceHash();

  @$internal
  @override
  $ProviderElement<LocalDatabaseService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalDatabaseService create(Ref ref) {
    return sqfliteService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalDatabaseService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalDatabaseService>(value),
    );
  }
}

String _$sqfliteServiceHash() => r'9a8fe1e2c35276eb217a7ed69007a62e60d05fe5';
