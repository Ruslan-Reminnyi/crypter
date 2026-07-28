import 'package:crypter/data/models/ai/recommendations/ai_recommendation.dart';

abstract interface class AiRepository {
  Future<List<AiRecommendation>> generateOrderCreationRecommendations({
    required String symbol,
    required String interval,
    required int limit,
  });
}
