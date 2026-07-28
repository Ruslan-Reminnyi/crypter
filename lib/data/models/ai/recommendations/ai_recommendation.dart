import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_recommendation.freezed.dart';
part 'ai_recommendation.g.dart';

@freezed
abstract class AiRecommendation with _$AiRecommendation {
  const factory AiRecommendation({
    required String orderType,
    required double? takeProfit,
    required double? stopLoss,
    required String explanation,
  }) = _AiRecommendation;

  factory AiRecommendation.fromJson(Map<String, dynamic> json) => _$AiRecommendationFromJson(json);
}
