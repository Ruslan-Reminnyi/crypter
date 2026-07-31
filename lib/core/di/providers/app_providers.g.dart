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
    r'38ba7164c9e3e439f25d6aa2b5a1dd7c8b5fcbc8';

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

@ProviderFor(chartBaseUrl)
final chartBaseUrlProvider = ChartBaseUrlProvider._();

final class ChartBaseUrlProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  ChartBaseUrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chartBaseUrlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chartBaseUrlHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return chartBaseUrl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$chartBaseUrlHash() => r'46b3f39c53be4fd9dfb35bc4cafd92ea52d4d735';

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

@ProviderFor(chartDio)
final chartDioProvider = ChartDioProvider._();

final class ChartDioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  ChartDioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chartDioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chartDioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return chartDio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$chartDioHash() => r'6d040cc9bcababd6c997eced831fb009affd81f7';

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

String _$webSocketChannelHash() => r'e77def9cfe8fb9660546b17d08aaa25acdeed004';

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

String _$routerHash() => r'76999e02935bc0baf1322a5b32989f826c600f97';

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

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'28d84d33b40a1a6fa8d00a9193a570560b3c9b71';

@ProviderFor(apiBaseUrl)
final apiBaseUrlProvider = ApiBaseUrlProvider._();

final class ApiBaseUrlProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  ApiBaseUrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiBaseUrlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiBaseUrlHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return apiBaseUrl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$apiBaseUrlHash() => r'028d6ecd946d777b5d17fde033ef70f6036db6d1';

@ProviderFor(apiDio)
final apiDioProvider = ApiDioProvider._();

final class ApiDioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  ApiDioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiDioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiDioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return apiDio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$apiDioHash() => r'658fb192469547bfe31e43ad555f5e9a0e1d2e75';

@ProviderFor(profileRepository)
final profileRepositoryProvider = ProfileRepositoryProvider._();

final class ProfileRepositoryProvider
    extends
        $FunctionalProvider<
          ProfileRepository,
          ProfileRepository,
          ProfileRepository
        >
    with $Provider<ProfileRepository> {
  ProfileRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProfileRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProfileRepository create(Ref ref) {
    return profileRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileRepository>(value),
    );
  }
}

String _$profileRepositoryHash() => r'99f4f47c06de2c82060dce161f2575ad42a761b9';

@ProviderFor(laravelDatabaseService)
final laravelDatabaseServiceProvider = LaravelDatabaseServiceProvider._();

final class LaravelDatabaseServiceProvider
    extends
        $FunctionalProvider<
          RemoteDatabaseService,
          RemoteDatabaseService,
          RemoteDatabaseService
        >
    with $Provider<RemoteDatabaseService> {
  LaravelDatabaseServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'laravelDatabaseServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$laravelDatabaseServiceHash();

  @$internal
  @override
  $ProviderElement<RemoteDatabaseService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RemoteDatabaseService create(Ref ref) {
    return laravelDatabaseService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RemoteDatabaseService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RemoteDatabaseService>(value),
    );
  }
}

String _$laravelDatabaseServiceHash() =>
    r'fd97c087543208c37b1c76603cb043620fc27e39';

@ProviderFor(aiRepository)
final aiRepositoryProvider = AiRepositoryProvider._();

final class AiRepositoryProvider
    extends $FunctionalProvider<AiRepository, AiRepository, AiRepository>
    with $Provider<AiRepository> {
  AiRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aiRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aiRepositoryHash();

  @$internal
  @override
  $ProviderElement<AiRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AiRepository create(Ref ref) {
    return aiRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AiRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AiRepository>(value),
    );
  }
}

String _$aiRepositoryHash() => r'f9bc0b55a981f2c3eed44086fa23054712434dbb';

@ProviderFor(notificationsRepository)
final notificationsRepositoryProvider = NotificationsRepositoryProvider._();

final class NotificationsRepositoryProvider
    extends
        $FunctionalProvider<
          NotificationsRepository,
          NotificationsRepository,
          NotificationsRepository
        >
    with $Provider<NotificationsRepository> {
  NotificationsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationsRepositoryHash();

  @$internal
  @override
  $ProviderElement<NotificationsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationsRepository create(Ref ref) {
    return notificationsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationsRepository>(value),
    );
  }
}

String _$notificationsRepositoryHash() =>
    r'b65b1856065cfbd7f76d3e1eafbb9a6bc6f53a96';
