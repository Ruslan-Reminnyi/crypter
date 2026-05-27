import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:crypter/core/urls.dart';
import 'package:crypter/data/services/crypto_info_service_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key, required this.title});

  final String title;

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final List<Candle> _candles = [];
  WebSocketChannel? _webSocketChannel;

  @override
  void initState() {
    _webSocketChannel = WebSocketChannel.connect(Uri.parse(binanceBaseWebSocketUrl));
    _webSocketChannel?.sink.add(
      jsonEncode({
        "method": "SUBSCRIBE",
        "params": ['ethusdt@kline_1d'],
        "id": 1,
      }),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    await _webSocketChannel?.ready;

    final dio = Dio();
    final stringJson = await CryptoInfoServiceImpl(dio).getCryptoInfo();
    List<dynamic> json = jsonDecode(stringJson);
    final candlesList = json
        .map(
          (candle) => Candle(
            date: DateTime.fromMillisecondsSinceEpoch(candle[0]),
            open: candle[1],
            high: candle[2],
            low: candle[3],
            close: candle[4],
            volume: candle[5],
          ),
        )
        .toList()
        .reversed;

    setState(() {
      _candles.addAll(candlesList);
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SizedBox.square(
        dimension: width,
        child: StreamBuilder(
          stream: _webSocketChannel?.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              final json = jsonDecode(snapshot.data)['k'];
              if (json != null) {
                final newestCandle = Candle(
                  date: DateTime.fromMillisecondsSinceEpoch(json['t']),
                  open: double.parse(json['o']),
                  high: double.parse(json['h']),
                  low: double.parse(json['l']),
                  close: double.parse(json['c']),
                  volume: double.parse(json['v']),
                );

                _candles[0] = newestCandle;

                return Candlesticks(candles: _candles);
              }
            }

            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _webSocketChannel?.sink.add(
      jsonEncode({
        "method": "UNSUBSCRIBE",
        "params": ['ethusdt@kline_1d'],
        "id": 1,
      }),
    );
    _webSocketChannel?.sink.close();
    super.dispose();
  }
}
