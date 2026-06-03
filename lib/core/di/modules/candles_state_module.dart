import 'package:candlesticks/candlesticks.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@module
abstract class CandlesStateModule {
  @lazySingleton
  BehaviorSubject<List<Candle>> get behaviourSubject => BehaviorSubject.seeded(<Candle>[]);
}
