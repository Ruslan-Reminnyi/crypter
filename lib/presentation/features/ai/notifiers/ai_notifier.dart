import 'package:crypter/core/di/providers/app_providers.dart';
import 'package:crypter/data/models/ai/recommendations/ai_recommendation.dart';
import 'package:crypter/domain/repositories/ai_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ai_notifier.g.dart';

@riverpod
class AiNotifier extends _$AiNotifier {
  AiRepository get _aiRepository => ref.read(aiRepositoryProvider);

  @override
  List<AiRecommendation> build() {
    return [];
  }

  void generateOrderCreationRecommendations() {
    _aiRepository
        .generateOrderCreationRecommendations(symbol: 'ETH/USDT', interval: '1d', limit: 30)
        .then((items) => state = items);
  }
}
