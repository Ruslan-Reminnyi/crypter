// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_recommendations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiRecommendationsResponse _$AiRecommendationsResponseFromJson(
  Map<String, dynamic> json,
) => _AiRecommendationsResponse(
  recommendations: (json['recommendations'] as List<dynamic>)
      .map((e) => AiRecommendation.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AiRecommendationsResponseToJson(
  _AiRecommendationsResponse instance,
) => <String, dynamic>{'recommendations': instance.recommendations};
