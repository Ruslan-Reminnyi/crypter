import 'package:crypter/data/models/ai/recommendations/ai_recommendations_response.dart';
import 'package:crypter/data/remote/api_endpoints.dart';
import 'package:crypter/domain/repositories/ai_repository.dart';
import 'package:crypter/domain/services/local/local_storage_service.dart';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker/talker.dart';

class AiRepositoryImpl implements AiRepository {
  final Dio _dio;
  final LocalStorageService _sharedPreferences;
  final Talker _talker;

  AiRepositoryImpl(this._dio, this._sharedPreferences, this._talker) {
    _dio.interceptors.add(
      TalkerDioLogger(
        talker: _talker,
        settings: TalkerDioLoggerSettings(printResponseHeaders: true),
      ),
    );
  }

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

      _talker.info('Generated an order creation recommendations');

      return AiRecommendationsResponse.fromJson(response.data['data']);
    } on DioException catch (e, st) {
      if (e.type == DioExceptionType.connectionError) {
        _talker.warning('Server is not working - $e');
      } else if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        _talker.warning('Encountering a timeout');
      } else {
        _talker.critical('Error generating recommendations - ', e.error, st);
      }
      return null;
    }
  }
}
