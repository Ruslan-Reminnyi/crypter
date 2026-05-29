import 'package:candlesticks/candlesticks.dart';

extension ListType on List {
  List<Candle> toCandles() => map((json) => Candle.fromList(json)).toList().reversed.toList();
}
