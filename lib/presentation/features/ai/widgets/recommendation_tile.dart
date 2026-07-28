import 'package:crypter/data/models/ai/recommendations/ai_recommendation.dart';
import 'package:flutter/material.dart';

class RecommendationTile extends StatelessWidget {
  final AiRecommendation recommendation;

  const RecommendationTile({super.key, required this.recommendation});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(recommendation.orderType),
        Text(recommendation.takeProfit.toString()),
        Text(recommendation.stopLoss.toString()),
        Text(recommendation.explanation),
      ],
    );
  }
}
