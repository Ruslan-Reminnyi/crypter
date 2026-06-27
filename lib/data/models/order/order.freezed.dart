// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Order {

 int get number; Symbol get symbol; Exchange get exchange; Side get side; double get quantity;@JsonKey(name: 'price') double get fillPrice; DateTime get placingTime; OrderStatus get status; double? get takeProfit; double? get stopLoss; DateTime? get closingTime; String? get leverage; double? get margin; double? get realizedPnL;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.number, number) || other.number == number)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.exchange, exchange) || other.exchange == exchange)&&(identical(other.side, side) || other.side == side)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.fillPrice, fillPrice) || other.fillPrice == fillPrice)&&(identical(other.placingTime, placingTime) || other.placingTime == placingTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.takeProfit, takeProfit) || other.takeProfit == takeProfit)&&(identical(other.stopLoss, stopLoss) || other.stopLoss == stopLoss)&&(identical(other.closingTime, closingTime) || other.closingTime == closingTime)&&(identical(other.leverage, leverage) || other.leverage == leverage)&&(identical(other.margin, margin) || other.margin == margin)&&(identical(other.realizedPnL, realizedPnL) || other.realizedPnL == realizedPnL));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,symbol,exchange,side,quantity,fillPrice,placingTime,status,takeProfit,stopLoss,closingTime,leverage,margin,realizedPnL);

@override
String toString() {
  return 'Order(number: $number, symbol: $symbol, exchange: $exchange, side: $side, quantity: $quantity, fillPrice: $fillPrice, placingTime: $placingTime, status: $status, takeProfit: $takeProfit, stopLoss: $stopLoss, closingTime: $closingTime, leverage: $leverage, margin: $margin, realizedPnL: $realizedPnL)';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 int number, Symbol symbol, Exchange exchange, Side side, double quantity,@JsonKey(name: 'price') double fillPrice, DateTime placingTime, OrderStatus status, double? takeProfit, double? stopLoss, DateTime? closingTime, String? leverage, double? margin, double? realizedPnL
});




}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? symbol = null,Object? exchange = null,Object? side = null,Object? quantity = null,Object? fillPrice = null,Object? placingTime = null,Object? status = null,Object? takeProfit = freezed,Object? stopLoss = freezed,Object? closingTime = freezed,Object? leverage = freezed,Object? margin = freezed,Object? realizedPnL = freezed,}) {
  return _then(_self.copyWith(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as Symbol,exchange: null == exchange ? _self.exchange : exchange // ignore: cast_nullable_to_non_nullable
as Exchange,side: null == side ? _self.side : side // ignore: cast_nullable_to_non_nullable
as Side,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,fillPrice: null == fillPrice ? _self.fillPrice : fillPrice // ignore: cast_nullable_to_non_nullable
as double,placingTime: null == placingTime ? _self.placingTime : placingTime // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,takeProfit: freezed == takeProfit ? _self.takeProfit : takeProfit // ignore: cast_nullable_to_non_nullable
as double?,stopLoss: freezed == stopLoss ? _self.stopLoss : stopLoss // ignore: cast_nullable_to_non_nullable
as double?,closingTime: freezed == closingTime ? _self.closingTime : closingTime // ignore: cast_nullable_to_non_nullable
as DateTime?,leverage: freezed == leverage ? _self.leverage : leverage // ignore: cast_nullable_to_non_nullable
as String?,margin: freezed == margin ? _self.margin : margin // ignore: cast_nullable_to_non_nullable
as double?,realizedPnL: freezed == realizedPnL ? _self.realizedPnL : realizedPnL // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int number,  Symbol symbol,  Exchange exchange,  Side side,  double quantity, @JsonKey(name: 'price')  double fillPrice,  DateTime placingTime,  OrderStatus status,  double? takeProfit,  double? stopLoss,  DateTime? closingTime,  String? leverage,  double? margin,  double? realizedPnL)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.number,_that.symbol,_that.exchange,_that.side,_that.quantity,_that.fillPrice,_that.placingTime,_that.status,_that.takeProfit,_that.stopLoss,_that.closingTime,_that.leverage,_that.margin,_that.realizedPnL);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int number,  Symbol symbol,  Exchange exchange,  Side side,  double quantity, @JsonKey(name: 'price')  double fillPrice,  DateTime placingTime,  OrderStatus status,  double? takeProfit,  double? stopLoss,  DateTime? closingTime,  String? leverage,  double? margin,  double? realizedPnL)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.number,_that.symbol,_that.exchange,_that.side,_that.quantity,_that.fillPrice,_that.placingTime,_that.status,_that.takeProfit,_that.stopLoss,_that.closingTime,_that.leverage,_that.margin,_that.realizedPnL);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int number,  Symbol symbol,  Exchange exchange,  Side side,  double quantity, @JsonKey(name: 'price')  double fillPrice,  DateTime placingTime,  OrderStatus status,  double? takeProfit,  double? stopLoss,  DateTime? closingTime,  String? leverage,  double? margin,  double? realizedPnL)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.number,_that.symbol,_that.exchange,_that.side,_that.quantity,_that.fillPrice,_that.placingTime,_that.status,_that.takeProfit,_that.stopLoss,_that.closingTime,_that.leverage,_that.margin,_that.realizedPnL);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Order extends Order {
  const _Order({required this.number, required this.symbol, required this.exchange, required this.side, required this.quantity, @JsonKey(name: 'price') required this.fillPrice, required this.placingTime, required this.status, this.takeProfit, this.stopLoss, this.closingTime, this.leverage, this.margin, this.realizedPnL}): super._();
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

@override final  int number;
@override final  Symbol symbol;
@override final  Exchange exchange;
@override final  Side side;
@override final  double quantity;
@override@JsonKey(name: 'price') final  double fillPrice;
@override final  DateTime placingTime;
@override final  OrderStatus status;
@override final  double? takeProfit;
@override final  double? stopLoss;
@override final  DateTime? closingTime;
@override final  String? leverage;
@override final  double? margin;
@override final  double? realizedPnL;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.number, number) || other.number == number)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.exchange, exchange) || other.exchange == exchange)&&(identical(other.side, side) || other.side == side)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.fillPrice, fillPrice) || other.fillPrice == fillPrice)&&(identical(other.placingTime, placingTime) || other.placingTime == placingTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.takeProfit, takeProfit) || other.takeProfit == takeProfit)&&(identical(other.stopLoss, stopLoss) || other.stopLoss == stopLoss)&&(identical(other.closingTime, closingTime) || other.closingTime == closingTime)&&(identical(other.leverage, leverage) || other.leverage == leverage)&&(identical(other.margin, margin) || other.margin == margin)&&(identical(other.realizedPnL, realizedPnL) || other.realizedPnL == realizedPnL));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,symbol,exchange,side,quantity,fillPrice,placingTime,status,takeProfit,stopLoss,closingTime,leverage,margin,realizedPnL);

@override
String toString() {
  return 'Order(number: $number, symbol: $symbol, exchange: $exchange, side: $side, quantity: $quantity, fillPrice: $fillPrice, placingTime: $placingTime, status: $status, takeProfit: $takeProfit, stopLoss: $stopLoss, closingTime: $closingTime, leverage: $leverage, margin: $margin, realizedPnL: $realizedPnL)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 int number, Symbol symbol, Exchange exchange, Side side, double quantity,@JsonKey(name: 'price') double fillPrice, DateTime placingTime, OrderStatus status, double? takeProfit, double? stopLoss, DateTime? closingTime, String? leverage, double? margin, double? realizedPnL
});




}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? symbol = null,Object? exchange = null,Object? side = null,Object? quantity = null,Object? fillPrice = null,Object? placingTime = null,Object? status = null,Object? takeProfit = freezed,Object? stopLoss = freezed,Object? closingTime = freezed,Object? leverage = freezed,Object? margin = freezed,Object? realizedPnL = freezed,}) {
  return _then(_Order(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as Symbol,exchange: null == exchange ? _self.exchange : exchange // ignore: cast_nullable_to_non_nullable
as Exchange,side: null == side ? _self.side : side // ignore: cast_nullable_to_non_nullable
as Side,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,fillPrice: null == fillPrice ? _self.fillPrice : fillPrice // ignore: cast_nullable_to_non_nullable
as double,placingTime: null == placingTime ? _self.placingTime : placingTime // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,takeProfit: freezed == takeProfit ? _self.takeProfit : takeProfit // ignore: cast_nullable_to_non_nullable
as double?,stopLoss: freezed == stopLoss ? _self.stopLoss : stopLoss // ignore: cast_nullable_to_non_nullable
as double?,closingTime: freezed == closingTime ? _self.closingTime : closingTime // ignore: cast_nullable_to_non_nullable
as DateTime?,leverage: freezed == leverage ? _self.leverage : leverage // ignore: cast_nullable_to_non_nullable
as String?,margin: freezed == margin ? _self.margin : margin // ignore: cast_nullable_to_non_nullable
as double?,realizedPnL: freezed == realizedPnL ? _self.realizedPnL : realizedPnL // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
