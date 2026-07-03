import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:crypter/data/extensions/list_extensions.dart';
import 'package:crypter/data/remote/endpoints.dart';
import 'package:crypter/domain/repositories/crypto_info_repository.dart';
import 'package:crypter/domain/services/remote/web_socket_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide Interval;
import 'package:rxdart/rxdart.dart';

class BinanceCryptoInfoRepository implements CryptoInfoRepository {
  final Dio _dio;
  final WebSocketService _webSocket;
  final BehaviorSubject<List<Candle>> _subject;

  BinanceCryptoInfoRepository(this._dio, this._webSocket, this._subject);

  @override
  Stream<List<Candle>> get stream => _subject.stream;

  Future<List<Candle>> _fetchCryptoTradingHistory({
    required String symbol,
    required String interval,
    int? limit,
  }) async {
    try {
      final response = await _dio.get(
        Endpoints.binanceApi.klines,
        queryParameters: {
          'symbol': symbol.toUpperCase(),
          'interval': interval,
          'limit': limit ?? 30,
        },
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
  void subscribeToWebSocket(int id, {required String symbol, required String interval}) {
    _fetchCryptoTradingHistory(
      symbol: symbol,
      interval: interval,
    ).then((history) => _subject.add(history));

    _webSocket.subscribe(id, symbol: symbol, interval: interval);
  }

  @override
  void unsubscribeFromWebSocket(int id, {required String symbol, required String interval}) {
    _webSocket.unsubscribe(id, symbol: symbol, interval: interval);

    _subject.value.clear();
  }

  @override
  void listenToWebSocketStream() {
    _webSocket.stream.listen(
      (item) {
        final json = jsonDecode(item)['k'];
        if (json != null && _subject.value.isNotEmpty) {
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
