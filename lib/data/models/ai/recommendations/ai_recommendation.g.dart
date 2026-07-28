// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiRecommendation _$AiRecommendationFromJson(Map<String, dynamic> json) =>
    _AiRecommendation(
      orderType: json['orderType'] as String,
      takeProfit: (json['takeProfit'] as num?)?.toDouble(),
      stopLoss: (json['stopLoss'] as num?)?.toDouble(),
      explanation: json['explanation'] as String,
    );

Map<String, dynamic> _$AiRecommendationToJson(_AiRecommendation instance) =>
    <String, dynamic>{
      'orderType': instance.orderType,
      'takeProfit': instance.takeProfit,
      'stopLoss': instance.stopLoss,
      'explanation': instance.explanation,
    };
