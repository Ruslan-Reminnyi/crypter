// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  number: (json['number'] as num).toInt(),
  symbol: $enumDecode(_$SymbolEnumMap, json['symbol']),
  exchange: $enumDecode(_$ExchangeEnumMap, json['exchange']),
  side: $enumDecode(_$SideEnumMap, json['side']),
  quantity: (json['quantity'] as num).toDouble(),
  fillPrice: (json['price'] as num).toDouble(),
  placingTime: DateTime.parse(json['placingTime'] as String),
  status: $enumDecode(_$OrderStatusEnumMap, json['status']),
  takeProfit: (json['takeProfit'] as num?)?.toDouble(),
  stopLoss: (json['stopLoss'] as num?)?.toDouble(),
  closingTime: json['closingTime'] == null
      ? null
      : DateTime.parse(json['closingTime'] as String),
  leverage: json['leverage'] as String?,
  margin: (json['margin'] as num?)?.toDouble(),
  realizedPnL: (json['realizedPnL'] as num?)?.toDouble(),
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'number': instance.number,
  'symbol': _$SymbolEnumMap[instance.symbol]!,
  'exchange': _$ExchangeEnumMap[instance.exchange]!,
  'side': _$SideEnumMap[instance.side]!,
  'quantity': instance.quantity,
  'price': instance.fillPrice,
  'placingTime': instance.placingTime.toIso8601String(),
  'status': _$OrderStatusEnumMap[instance.status]!,
  'takeProfit': instance.takeProfit,
  'stopLoss': instance.stopLoss,
  'closingTime': instance.closingTime?.toIso8601String(),
  'leverage': instance.leverage,
  'margin': instance.margin,
  'realizedPnL': instance.realizedPnL,
};

const _$SymbolEnumMap = {Symbol.ethusdt: 'ethusdt', Symbol.bnbusdt: 'bnbusdt'};

const _$ExchangeEnumMap = {Exchange.binance: 'binance'};

const _$SideEnumMap = {Side.long: 'long', Side.short: 'short'};

const _$OrderStatusEnumMap = {
  OrderStatus.working: 'working',
  OrderStatus.inactive: 'inactive',
  OrderStatus.filled: 'filled',
  OrderStatus.canceled: 'canceled',
  OrderStatus.rejected: 'rejected',
};
