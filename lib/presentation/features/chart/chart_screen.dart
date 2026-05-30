import 'package:candlesticks/candlesticks.dart';
import 'package:crypter/data/repositories/binance_crypto_info_repo.dart';
import 'package:crypter/data/services/remote/binance_web_socket_service.dart';
import 'package:crypter/domain/repositories/crypto_info_repo.dart';
import 'package:flutter/material.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key, required this.title});

  final String title;

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  late CryptoInfoRepo _cryptoInfoRepo;

  @override
  void initState() {
    final binanceWebSocketService = BinanceWebSocketService();
    _cryptoInfoRepo = BinanceCryptoInfoRepo(binanceWebSocketService);
    _cryptoInfoRepo.subscribeToWebSocket();
    _cryptoInfoRepo.listenToWebSocketChannelStream();
    super.initState();
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
        child: StreamBuilder<List<Candle>>(
          stream: _cryptoInfoRepo.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return Candlesticks(candles: snapshot.data!);
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cryptoInfoRepo.unsubscribeFromWebSocket();
    _cryptoInfoRepo.dispose();
    super.dispose();
  }
}
