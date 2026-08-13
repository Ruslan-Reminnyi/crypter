import 'package:crypter/data/models/ai/recommendations/ai_recommendations_response.dart';

abstract interface class AiRepository {
  Future<AiRecommendationsResponse?> generateOrderCreationRecommendations({
    required String symbol,
    required String interval,
    required int limit,
    required String prompt,
  });
}
