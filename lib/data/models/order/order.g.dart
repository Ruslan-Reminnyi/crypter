// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  id: (json['_id'] as num?)?.toInt(),
  number: (json['number'] as num).toInt(),
  symbol: $enumDecode(_$SymbolEnumMap, json['symbol']),
  exchange: $enumDecode(_$ExchangeEnumMap, json['exchange']),
  side: $enumDecode(_$SideEnumMap, json['side']),
  quantity: (json['quantity'] as num).toDouble(),
  fillPrice: (json['price'] as num).toDouble(),
  placingTime: const DateTimeConverter().fromJson(
    (json['placingTime'] as num).toInt(),
  ),
  status: $enumDecode(_$OrderStatusEnumMap, json['status']),
  takeProfit: (json['takeProfit'] as num?)?.toDouble(),
  stopLoss: (json['stopLoss'] as num?)?.toDouble(),
  closingTime: _$JsonConverterFromJson<int, DateTime>(
    json['closingTime'],
    const DateTimeConverter().fromJson,
  ),
  leverage: json['leverage'] as String?,
  margin: (json['margin'] as num?)?.toDouble(),
  realizedPnL: (json['realizedPnL'] as num?)?.toDouble(),
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  '_id': instance.id,
  'number': instance.number,
  'symbol': _$SymbolEnumMap[instance.symbol]!,
  'exchange': _$ExchangeEnumMap[instance.exchange]!,
  'side': _$SideEnumMap[instance.side]!,
  'quantity': instance.quantity,
  'price': instance.fillPrice,
  'placingTime': const DateTimeConverter().toJson(instance.placingTime),
  'status': _$OrderStatusEnumMap[instance.status]!,
  'takeProfit': instance.takeProfit,
  'stopLoss': instance.stopLoss,
  'closingTime': _$JsonConverterToJson<int, DateTime>(
    instance.closingTime,
    const DateTimeConverter().toJson,
  ),
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

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
