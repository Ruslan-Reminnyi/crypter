import 'package:crypter/core/urls.dart';
import 'package:crypter/domain/services/crypto_info_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide Interval;

class CryptoInfoServiceImpl implements CryptoInfoService {
  final Dio _dio;

  CryptoInfoServiceImpl(this._dio);

  @override
  Future<String> getCryptoInfo({
    String? symbol = 'ETHUSDT',
    String? interval = '1d',
    int? limit = 30,
  }) async {
    try {
      final response = await _dio.get(
        binanceCryptoInfoUrl,
        queryParameters: {'symbol': symbol, 'interval': interval, 'limit': limit},
      );

      return response.data.toString();
    } catch (e, st) {
      final error = 'Error getting crypto info from Binance API: $e\n$st';
      debugPrint(error);
      return error;
    }
  }
}
