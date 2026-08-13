import 'package:crypter/data/models/ai/recommendations/ai_recommendation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_recommendations_response.freezed.dart';
part 'ai_recommendations_response.g.dart';

@freezed
abstract class AiRecommendationsResponse with _$AiRecommendationsResponse {
  const factory AiRecommendationsResponse({
    required String title,
    required String description,
    required List<AiRecommendation> recommendations,
  }) = _AiRecommendationsResponse;

  factory AiRecommendationsResponse.fromJson(Map<String, dynamic> json) =>
      _$AiRecommendationsResponseFromJson(json);
}
