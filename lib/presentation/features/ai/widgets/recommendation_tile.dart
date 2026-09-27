import 'package:crypter/data/extensions/build_context_extensions.dart';
import 'package:crypter/data/extensions/string_extensions.dart';
import 'package:crypter/data/models/ai/recommendations/ai_recommendation.dart';
import 'package:crypter/domain/enums/side.dart';
import 'package:flutter/material.dart';

class RecommendationTile extends StatelessWidget {
  final AiRecommendation recommendation;
  final int number;

  const RecommendationTile({super.key, required this.recommendation, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text('#$number', style: Theme.of(context).textTheme.bodySmall),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colors.tertiaryContainer,
                  shape: .rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    spacing: 2.0,
                    children: [
                      Icon(
                        recommendation.orderType.toSide().icon,
                        color: context.colors.labelLarge,
                        size: 18.0,
                      ),
                      Text(
                        recommendation.orderType.toUpperCase(),
                        style: TextStyle(color: context.colors.labelLarge),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          _RecommendationContainer(
            Text(context.l10n.takeProfit.toUpperCase()),
            Text(
              '\$${recommendation.takeProfit}',
              style: TextStyle(color: Theme.of(context).colorScheme.primaryContainer),
            ),
            crossAxisAlignment: .start,
          ),
          SizedBox(height: 8.0),
          _RecommendationContainer(
            Text(context.l10n.stopLoss.toUpperCase()),
            Text(
              '\$${recommendation.stopLoss}',
              style: TextStyle(color: Theme.of(context).colorScheme.onTertiaryContainer),
            ),
            crossAxisAlignment: .start,
          ),
          SizedBox(height: 8),
          _RecommendationContainer(
            Align(child: Text(context.l10n.explanation.toUpperCase())),
            Text(recommendation.explanation, textAlign: .justify),
          ),
        ],
      ),
    );
  }
}

class _RecommendationContainer extends StatelessWidget {
  final Widget _titleWidget;
  final Widget _valueWidget;
  final CrossAxisAlignment? _crossAxisAlignment;

  const _RecommendationContainer(this._titleWidget, this._valueWidget, {this._crossAxisAlignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(4.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: _crossAxisAlignment ?? .center,
        children: [_titleWidget, _valueWidget],
      ),
    );
  }
}

extension on Side {
  IconData get icon => switch (this) {
    .long => Icons.trending_up_rounded,
    .short => Icons.trending_down_rounded,
  };
}
