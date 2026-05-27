import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:crypter/data/services/crypto_info_service_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key, required this.title});

  final String title;

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  List<Candle> _candles = [];

  @override
  void didChangeDependencies() async {
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
        child: Candlesticks(candles: _candles),
      ),
    );
  }
}
