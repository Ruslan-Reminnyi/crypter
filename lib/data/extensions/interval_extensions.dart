import 'package:crypter/domain/enums/interval.dart';

extension IntervalType on Interval {
  String get value {
    switch (this) {
      case Interval.oneHour:
        return '1h';
      case Interval.fourHours:
        return '4h';
      case Interval.oneDay:
        return '1d';
    }
  }
}
