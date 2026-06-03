import 'package:candlesticks/candlesticks.dart';
import 'package:crypter/domain/enums/exchange.dart';
import 'package:crypter/domain/enums/interval.dart';
import 'package:crypter/domain/enums/symbol.dart';
import 'package:crypter/domain/repositories/crypto_info_repo.dart';
import 'package:flutter/material.dart' hide Interval;
import 'package:get_it/get_it.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key, required this.title});

  final String title;

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  late CryptoInfoRepo _cryptoInfoRepo;
  Symbol _symbol = Symbol.ethusdt;
  Interval _interval = Interval.oneDay;
  Exchange _exchange = Exchange.binance;

  @override
  void initState() {
    _cryptoInfoRepo = GetIt.I<CryptoInfoRepo>();
    _cryptoInfoRepo.subscribeToWebSocket(1, symbol: _symbol.symbol, interval: _interval.timeframe);
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                DropdownMenu(
                  dropdownMenuEntries: Symbol.values
                      .map(
                        (pair) =>
                            DropdownMenuEntry(value: pair.displayName, label: pair.displayName),
                      )
                      .toList(),
                  width: 160,
                  initialSelection: _symbol.displayName,
                  onSelected: (value) {
                    final previousSymbol = _symbol.symbol;
                    _symbol = Symbol.values.where((pair) => pair.displayName == value).first;
                    _changeSettings(previousSymbol: previousSymbol);
                  },
                ),
                DropdownMenu(
                  dropdownMenuEntries: Interval.values
                      .map(
                        (interval) =>
                            DropdownMenuEntry(value: interval.timeframe, label: interval.timeframe),
                      )
                      .toList(),
                  width: 100,
                  initialSelection: _interval.timeframe,
                  onSelected: (value) {
                    final previousInterval = _interval.timeframe;
                    _interval = Interval.values
                        .where((interval) => interval.timeframe == value)
                        .first;
                    _changeSettings(previousInterval: previousInterval);
                  },
                ),
                DropdownMenu(
                  dropdownMenuEntries: Exchange.values
                      .map(
                        (exchange) => DropdownMenuEntry(
                          value: exchange.displayName,
                          label: exchange.displayName,
                        ),
                      )
                      .toList(),
                  width: 140,
                  initialSelection: _exchange.displayName,
                  onSelected: (value) {
                    _exchange = Exchange.values
                        .where((exchange) => exchange.displayName == value)
                        .first;
                  },
                ),
              ],
            ),
            Expanded(
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
          ],
        ),
      ),
    );
  }

  void _changeSettings({String? previousSymbol, String? previousInterval}) {
    _cryptoInfoRepo.unsubscribeFromWebSocket(
      1,
      symbol: previousSymbol ?? _symbol.symbol,
      interval: previousInterval ?? _interval.timeframe,
    );
    _cryptoInfoRepo.subscribeToWebSocket(1, symbol: _symbol.symbol, interval: _interval.timeframe);
  }

  @override
  void dispose() {
    _cryptoInfoRepo.unsubscribeFromWebSocket(
      1,
      symbol: _symbol.symbol,
      interval: _interval.timeframe,
    );
    _cryptoInfoRepo.dispose();
    super.dispose();
  }
}
