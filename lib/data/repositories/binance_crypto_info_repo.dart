import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:crypter/data/extensions/list_extensions.dart';
import 'package:crypter/data/remote/endpoints.dart';
import 'package:crypter/domain/repositories/crypto_info_repo.dart';
import 'package:crypter/domain/services/remote/web_socket_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide Interval;
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: CryptoInfoRepo)
class BinanceCryptoInfoRepo implements CryptoInfoRepo {
  final Dio _dio;
  final WebSocketService _webSocket;
  final BehaviorSubject<List<Candle>> _subject;

  BinanceCryptoInfoRepo(this._dio, this._webSocket, this._subject) {
    _init();
  }

  void _init() {
    _fetchCryptoTradingHistory().then((history) => _subject.add(history));
  }

  @override
  Stream<List<Candle>> get stream => _subject.stream;

  Future<List<Candle>> _fetchCryptoTradingHistory({
    String? symbol = 'ETHUSDT',
    String? interval = '1d',
    int? limit = 30,
  }) async {
    try {
      final response = await _dio.get(
        Endpoints.binanceApi.klines,
        queryParameters: {'symbol': symbol, 'interval': interval, 'limit': limit},
      );

      List<dynamic> data = jsonDecode(response.data.toString());

      return data.toCandles();
    } catch (e, st) {
      final error = 'Error getting crypto info from Binance API: $e\n$st';
      debugPrint(error);
      return [];
    }
  }

  @override
  void subscribeToWebSocket({int id = 1, String? symbol = "ethusdt", String? interval = '1d'}) =>
      _webSocket.subscribe();

  @override
  void unsubscribeFromWebSocket({
    int id = 1,
    String? symbol = 'ethusdt',
    String? interval = '1d',
  }) => _webSocket.unsubscribe();

  @override
  void listenToWebSocketChannelStream() {
    _webSocket.stream.listen(
      (item) {
        final json = jsonDecode(item)['k'];
        if (json != null) {
          final newestCandle = Candle.fromCompactJson(json);
          final currentCandles = List<Candle>.from(_subject.value);
          currentCandles[0] = newestCandle;
          _subject.add(currentCandles);
        }
      },
      onError: (error) {
        debugPrint('Error listening the WebSocketChannel stream: $error');
      },
    );
  }

  @override
  void dispose() {
    _webSocket.close();
    _subject.close();
  }
}
