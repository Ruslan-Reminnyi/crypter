import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:crypter/core/urls.dart';
import 'package:crypter/data/extensions/list_extensions.dart';
import 'package:crypter/domain/services/crypto_info_service.dart';
import 'package:crypter/domain/services/web_socket_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide Interval;
import 'package:rxdart/rxdart.dart';

class BinanceCryptoInfoService implements CryptoInfoService {
  final Dio _dio;
  final BehaviorSubject<List<Candle>> _subject;
  final WebSocketService _webSocket;

  BinanceCryptoInfoService(this._webSocket)
    : _dio = Dio(),
      _subject = BehaviorSubject.seeded(<Candle>[]) {
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
        binanceCryptoInfoUrl,
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
          final currentList = _subject.value;

          currentList[0] = newestCandle;
          _subject.add(currentList);
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
