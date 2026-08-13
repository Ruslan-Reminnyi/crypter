import 'package:crypter/data/models/ai/recommendations/ai_recommendation.dart';
import 'package:crypter/domain/enums/interval.dart';
import 'package:crypter/domain/enums/symbol.dart';

class AiState {
  final bool isLoading;
  final Symbol symbol;
  final Interval interval;
  final int limit;
  final String title;
  final String description;
  final List<AiRecommendation> recommendations;

  AiState({
    required this.isLoading,
    required this.symbol,
    required this.interval,
    required this.limit,
    required this.title,
    required this.description,
    required this.recommendations,
  });

  AiState copyWith({
    bool? isLoading,
    Symbol? symbol,
    Interval? interval,
    int? limit,
    String? title,
    String? description,
    List<AiRecommendation>? recommendations,
  }) {
    return AiState(
      isLoading: isLoading ?? this.isLoading,
      symbol: symbol ?? this.symbol,
      interval: interval ?? this.interval,
      limit: limit ?? this.limit,
      title: title ?? this.title,
      description: description ?? this.description,
      recommendations: recommendations ?? this.recommendations,
    );
  }
}
