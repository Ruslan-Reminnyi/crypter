import 'package:candlesticks/candlesticks.dart';
import 'package:crypter/presentation/features/chart/providers/crypto_info_repo_stream.dart';
import 'package:crypter/presentation/features/chart/widgets/chart_settings.dart';
import 'package:flutter/material.dart' hide Interval;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChartScreen extends ConsumerWidget {
  final String title;

  const ChartScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SizedBox.square(
        dimension: width,
        child: Column(
          children: [
            ChartSettings(),
            ref
                .watch(candlesProvider)
                .when(
                  data: (List<Candle> candles) => Flexible(child: Candlesticks(candles: candles)),
                  error: (Object error, StackTrace stackTrace) =>
                      Text("Error showing List<Candle> - $error\n$stackTrace"),
                  loading: () => const CircularProgressIndicator(),
                ),
          ],
        ),
      ),
    );
  }
}
