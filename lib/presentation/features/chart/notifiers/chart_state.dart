import 'package:crypter/domain/enums/exchange.dart';
import 'package:crypter/domain/enums/interval.dart';
import 'package:crypter/domain/enums/symbol.dart';

class ChartState {
  final Symbol symbol;
  final Interval interval;
  final Exchange exchange;

  ChartState({required this.symbol, required this.interval, required this.exchange});

  ChartState copyWith({Symbol? symbol, Interval? interval, Exchange? exchange}) {
    return ChartState(
      symbol: symbol ?? this.symbol,
      interval: interval ?? this.interval,
      exchange: exchange ?? this.exchange,
    );
  }
}
