import 'package:crypter/data/models/ai/recommendations/ai_recommendations_response.dart';
import 'package:crypter/data/remote/api_endpoints.dart';
import 'package:crypter/domain/repositories/ai_repository.dart';
import 'package:crypter/domain/services/local/local_storage_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AiRepositoryImpl implements AiRepository {
  final Dio _dio;
  final LocalStorageService _sharedPreferences;

  AiRepositoryImpl(this._dio, this._sharedPreferences);

  String? get _token => _sharedPreferences.token;

  @override
  Future<AiRecommendationsResponse?> generateOrderCreationRecommendations({
    required String symbol,
    required String interval,
    required int limit,
    required String prompt,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.ai.orderCreationRecommendations,
        options: Options(
          headers: {"Accept": "application.json", "Authorization": "Bearer $_token"},
        ),
        data: {'symbol': symbol, 'interval': interval, 'limit': limit, 'prompt': prompt},
      );

      return AiRecommendationsResponse.fromJson(response.data['data']);
    } on DioException catch (e, st) {
      debugPrint('Error getting recommendations: $e\n$st');
      return null;
    }
  }
}
