import 'package:crypter/data/models/ai/recommendations/ai_recommendation.dart';
import 'package:crypter/presentation/features/ai/notifiers/ai_notifier.dart';
import 'package:crypter/presentation/features/ai/widgets/recommendation_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AiScreen extends ConsumerWidget {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<AiRecommendation> recommendations = ref.watch(aiProvider);

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.question_answer_rounded),
        onPressed: () => ref.read(aiProvider.notifier).generateOrderCreationRecommendations(),
      ),
      body: ListView.separated(
        itemCount: recommendations.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) => RecommendationTile(recommendation: recommendations[index]),
      ),
    );
  }
}
