// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cryptoInfoRepo)
final cryptoInfoRepoProvider = CryptoInfoRepoProvider._();

final class CryptoInfoRepoProvider
    extends $FunctionalProvider<CryptoInfoRepo, CryptoInfoRepo, CryptoInfoRepo>
    with $Provider<CryptoInfoRepo> {
  CryptoInfoRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cryptoInfoRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cryptoInfoRepoHash();

  @$internal
  @override
  $ProviderElement<CryptoInfoRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CryptoInfoRepo create(Ref ref) {
    return cryptoInfoRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CryptoInfoRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CryptoInfoRepo>(value),
    );
  }
}

String _$cryptoInfoRepoHash() => r'6dc2508618957373940d5c71fdbeaa7221a504c8';

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
