import 'package:crypter/core/di/providers/app_providers.dart';
import 'package:crypter/domain/enums/exchange.dart';
import 'package:crypter/domain/enums/interval.dart';
import 'package:crypter/domain/enums/symbol.dart';
import 'package:crypter/domain/repositories/auth_repository.dart';
import 'package:crypter/domain/repositories/crypto_info_repository.dart';
import 'package:crypter/domain/services/local/local_storage_service.dart';
import 'package:crypter/presentation/features/chart/notifiers/chart_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chart_notifier.g.dart';

@riverpod
class ChartNotifier extends _$ChartNotifier {
  AuthRepository get _authRepository => ref.read(authRepositoryProvider);
  CryptoInfoRepository get _cryptoInfoRepository => ref.watch(cryptoInfoRepositoryProvider);
  LocalStorageService get _sharedPreferences => ref.read(sharedPreferencesServiceProvider);

  @override
  ChartState build() {
    final initialState = _getInitialState();

    _initWebSocket(initialState);

    return initialState;
  }

  ChartState _getInitialState() {
    final symbol = Symbol.values.firstWhere(
      (item) => item.symbol == _sharedPreferences.symbol,
      orElse: () => Symbol.ethusdt,
    );
    final interval = Interval.values.firstWhere(
      (item) => item.timeframe == _sharedPreferences.interval,
      orElse: () => Interval.oneDay,
    );

    return ChartState(symbol: symbol, interval: interval, exchange: Exchange.binance);
  }

  void _initWebSocket(ChartState chartState) {
    _cryptoInfoRepository.subscribeToWebSocket(
      1,
      symbol: chartState.symbol.symbol,
      interval: chartState.interval.timeframe,
    );
  }

  void _reconnectToWebSocket({String? previousSymbol, String? previousInterval}) {
    _cryptoInfoRepository
      ..unsubscribeFromWebSocket(
        1,
        symbol: previousSymbol ?? state.symbol.symbol,
        interval: previousInterval ?? state.interval.timeframe,
      )
      ..subscribeToWebSocket(1, symbol: state.symbol.symbol, interval: state.interval.timeframe);
  }

  void subscribeToWebSocket() => _cryptoInfoRepository.subscribeToWebSocket(
    1,
    symbol: state.symbol.symbol,
    interval: state.interval.timeframe,
  );

  void unsubscribeFromWebSocket() => _cryptoInfoRepository.unsubscribeFromWebSocket(
    1,
    symbol: state.symbol.symbol,
    interval: state.interval.timeframe,
  );

  Future<void> changeSymbol(Symbol newSymbol) async {
    final previousSymbol = state.symbol.symbol;
    state = state.copyWith(symbol: newSymbol);

    _reconnectToWebSocket(previousSymbol: previousSymbol);

    await _sharedPreferences.setSymbol(newSymbol.symbol);
  }

  Future<void> changeInterval(Interval newInterval) async {
    final previousInterval = state.interval.timeframe;
    state = state.copyWith(interval: newInterval);

    _reconnectToWebSocket(previousInterval: previousInterval);

    await _sharedPreferences.setInterval(newInterval.timeframe);
  }

  Future<void> logout() async {
    _cryptoInfoRepository.dispose();
    await _authRepository.logout();
  }
}
