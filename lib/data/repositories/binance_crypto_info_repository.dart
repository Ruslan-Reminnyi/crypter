import 'dart:async';
import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:crypter/data/extensions/list_extensions.dart';
import 'package:crypter/data/remote/chart_endpoints.dart';
import 'package:crypter/domain/repositories/crypto_info_repository.dart';
import 'package:crypter/domain/services/remote/web_socket_service.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:talker/talker.dart';

class BinanceCryptoInfoRepository implements CryptoInfoRepository {
  final Dio _dio;
  final WebSocketService _webSocket;
  final BehaviorSubject<List<Candle>> _subject;
  final Talker _talker;
  final StreamSubscription _streamSubscription;

  BinanceCryptoInfoRepository(this._dio, this._webSocket, this._subject, this._talker)
    : _streamSubscription = _webSocket.stream.listen(
        (item) {
          final json = jsonDecode(item)['k'];
          if (json != null && _subject.value.isNotEmpty) {
            final newestCandle = Candle.fromCompactJson(json);
            final currentCandles = List<Candle>.from(_subject.value);
            currentCandles[0] = newestCandle;
            _subject.add(currentCandles);
          }

          _talker.info('Refreshed the newest candle');
        },
        onError: (error) {
          _talker.critical('Error listening the WebSocketChannel stream - ', error);
        },
      );

  @override
  Stream<List<Candle>> get stream => _subject.stream;

  Future<List<Candle>> _fetchCryptoTradingHistory({
    required String symbol,
    required String interval,
    int? limit,
  }) async {
    final response = await _dio.get(
      ChartEndpoints.binanceApi.klines,
      queryParameters: {'symbol': symbol.toUpperCase(), 'interval': interval, 'limit': limit ?? 30},
    );

    _talker.info('Fetched crypto trading history');

    List<dynamic> data = jsonDecode(response.data.toString());

    return data.toCandles();
  }

  @override
  void subscribeToWebSocket(int id, {required String symbol, required String interval}) {
    _fetchCryptoTradingHistory(
      symbol: symbol,
      interval: interval,
    ).then((history) => _subject.add(history));

    _webSocket.subscribe(id, symbol: symbol, interval: interval);

    _streamSubscription.resume();

    _talker.info('Subscribed to the Binance Web Socket');
  }

  @override
  void unsubscribeFromWebSocket(int id, {required String symbol, required String interval}) {
    _webSocket.unsubscribe(id, symbol: symbol, interval: interval);

    _subject.value.clear();

    _streamSubscription.pause();

    _talker.info('Unsubscribed from the Binance Web Socket');
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    _subject.close();
    _webSocket.close();
  }
}
