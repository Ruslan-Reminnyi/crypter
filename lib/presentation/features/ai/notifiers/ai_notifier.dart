import 'package:crypter/core/di/providers/app_providers.dart';
import 'package:crypter/domain/enums/interval.dart';
import 'package:crypter/domain/enums/symbol.dart';
import 'package:crypter/domain/repositories/ai_repository.dart';
import 'package:crypter/domain/services/local/local_storage_service.dart';
import 'package:crypter/presentation/features/ai/notifiers/ai_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker/talker.dart';

part 'ai_notifier.g.dart';

@riverpod
class AiNotifier extends _$AiNotifier {
  AiRepository get _aiRepository => ref.read(aiRepositoryProvider);
  LocalStorageService get _sharedPreferences => ref.read(sharedPreferencesServiceProvider);
  Talker get _talker => ref.read(talkerProvider);

  @override
  AiState build() {
    final initialState = _getInitialState();

    return initialState;
  }

  AiState _getInitialState() {
    final symbol = Symbol.values.firstWhere(
      (item) => item.symbol == _sharedPreferences.symbol,
      orElse: () => Symbol.ethusdt,
    );
    final interval = Interval.values.firstWhere(
      (item) => item.timeframe == _sharedPreferences.symbol,
      orElse: () => Interval.oneDay,
    );
    final limit = _sharedPreferences.limit ?? 30;

    return AiState(
      isLoading: false,
      symbol: symbol,
      interval: interval,
      limit: limit,
      title: '',
      description: '',
      recommendations: [],
    );
  }

  Future<void> changeSymbol(Symbol newSymbol) async {
    state = state.copyWith(symbol: newSymbol);
    await _sharedPreferences.setSymbol(newSymbol.symbol);
  }

  Future<void> changeInterval(Interval newInterval) async {
    state = state.copyWith(interval: newInterval);
    await _sharedPreferences.setInterval(newInterval.timeframe);
  }

  Future<void> generateOrderCreationRecommendations(String prompt) async {
    try {
      state = state.copyWith(isLoading: true);

      final aiRecommendationsResponse = await _aiRepository.generateOrderCreationRecommendations(
        symbol: state.symbol.displayName,
        interval: state.interval.timeframe,
        limit: state.limit,
        prompt: prompt,
      );

      if (aiRecommendationsResponse != null) {
        state = state.copyWith(
          isLoading: false,
          title: aiRecommendationsResponse.title,
          description: aiRecommendationsResponse.description,
          recommendations: aiRecommendationsResponse.recommendations,
        );
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e, st) {
      _talker.error('Error generating order creation recommendations -', e, st);
      state = state.copyWith(isLoading: false);
    }
  }
}
