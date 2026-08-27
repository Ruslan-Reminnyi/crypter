import 'package:crypter/data/models/ai/recommendations/ai_recommendations_response.dart';
import 'package:crypter/data/remote/api_endpoints.dart';
import 'package:crypter/domain/repositories/ai_repository.dart';
import 'package:dio/dio.dart';
import 'package:talker/talker.dart';

class AiRepositoryImpl implements AiRepository {
  final Dio _dio;
  final Talker _talker;

  AiRepositoryImpl(this._dio, this._talker);

  @override
  Future<AiRecommendationsResponse?> generateOrderCreationRecommendations({
    required String symbol,
    required String interval,
    required int limit,
    required String prompt,
  }) async {
    final response = await _dio.post(
      ApiEndpoints.ai.orderCreationRecommendations,
      data: {'symbol': symbol, 'interval': interval, 'limit': limit, 'prompt': prompt},
    );

    _talker.info('Generated an order creation recommendations');

    return AiRecommendationsResponse.fromJson(response.data['data']);
  }
}
