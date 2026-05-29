import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:crypter/core/urls.dart';
import 'package:crypter/data/extensions/list_extensions.dart';
import 'package:crypter/domain/services/crypto_info_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide Interval;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:rxdart/rxdart.dart';

class BinanceCryptoInfoService implements CryptoInfoService {
  final Dio _dio;
  final BehaviorSubject<List<Candle>> _subject;
  final WebSocketChannel _webSocketChannel;

  BinanceCryptoInfoService()
    : _dio = Dio(),
      _subject = BehaviorSubject.seeded(<Candle>[]),
      _webSocketChannel = WebSocketChannel.connect(Uri.parse(binanceBaseWebSocketUrl)) {
    _init();
  }

  void _init() async {
    try {
      await _webSocketChannel.ready;
    } on WebSocketChannelException catch (error) {
      debugPrint('Error starting the WebSocketChannel - ${error.message}\n${error.inner}');
      return;
    }

    final history = await _fetchHistory();
    _subject.add(history);
  }

  @override
  Stream<List<Candle>> get stream => _subject.stream;

  Future<List<Candle>> _fetchHistory({
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
  void subscribeToWebSocket({int id = 1, String? symbol = "ethusdt", String? interval = '1d'}) {
    _webSocketChannel.sink.add(
      jsonEncode({
        "method": "SUBSCRIBE",
        "params": ['$symbol@kline_$interval'],
        "id": id,
      }),
    );
  }

  @override
  void unsubscribeFromWebSocket({int id = 1, String? symbol = 'ethusdt', String? interval = '1d'}) {
    _webSocketChannel.sink.add(
      jsonEncode({
        "method": "UNSUBSCRIBE",
        "params": ['$symbol@kline_$interval'],
        "id": id,
      }),
    );
  }

  @override
  void listenToWebSocketChannelStream() {
    _webSocketChannel.stream.listen(
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
    _webSocketChannel.sink.close();
    _subject.close();
  }
}
