import 'package:crypter/domain/enums/exchange.dart';
import 'package:crypter/domain/enums/order_status.dart';
import 'package:crypter/domain/enums/symbol.dart';
import 'package:crypter/domain/enums/side.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';

part 'order.g.dart';

@freezed
abstract class Order with _$Order {
  const Order._();

  const factory Order({
    required int number,
    required Symbol symbol,
    required Exchange exchange,
    required Side side,
    required double quantity,
    @JsonKey(name: 'price') required double fillPrice,
    required DateTime placingTime,
    required OrderStatus status,
    double? takeProfit,
    double? stopLoss,
    DateTime? closingTime,
    String? leverage,
    double? margin,
    double? realizedPnL,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  String? formatRealizedPnL() {
    if (realizedPnL == null) {
      return null;
    }
    return realizedPnL!.isNegative ? realizedPnL.toString() : '+$realizedPnL';
  }

  String? formatDateTime([bool isPlacingTime = true]) {
    return isPlacingTime
        ? placingTime.toString().substring(0, 16)
        : closingTime.toString().substring(0, 16);
  }
}
