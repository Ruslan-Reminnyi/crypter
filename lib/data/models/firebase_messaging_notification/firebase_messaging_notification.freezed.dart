// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase_messaging_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FirebaseMessagingNotification {

 int? get orderId; String get platform; String get symbol; String get side; double get stopLoss;@JsonKey(name: FirebaseMessagingNotification.kFirebaseMessagingToken) String? get firebaseMessagingToken;
/// Create a copy of FirebaseMessagingNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FirebaseMessagingNotificationCopyWith<FirebaseMessagingNotification> get copyWith => _$FirebaseMessagingNotificationCopyWithImpl<FirebaseMessagingNotification>(this as FirebaseMessagingNotification, _$identity);

  /// Serializes this FirebaseMessagingNotification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FirebaseMessagingNotification&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.side, side) || other.side == side)&&(identical(other.stopLoss, stopLoss) || other.stopLoss == stopLoss)&&(identical(other.firebaseMessagingToken, firebaseMessagingToken) || other.firebaseMessagingToken == firebaseMessagingToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,platform,symbol,side,stopLoss,firebaseMessagingToken);

@override
String toString() {
  return 'FirebaseMessagingNotification(orderId: $orderId, platform: $platform, symbol: $symbol, side: $side, stopLoss: $stopLoss, firebaseMessagingToken: $firebaseMessagingToken)';
}


}

/// @nodoc
abstract mixin class $FirebaseMessagingNotificationCopyWith<$Res>  {
  factory $FirebaseMessagingNotificationCopyWith(FirebaseMessagingNotification value, $Res Function(FirebaseMessagingNotification) _then) = _$FirebaseMessagingNotificationCopyWithImpl;
@useResult
$Res call({
 int? orderId, String platform, String symbol, String side, double stopLoss,@JsonKey(name: FirebaseMessagingNotification.kFirebaseMessagingToken) String? firebaseMessagingToken
});




}
/// @nodoc
class _$FirebaseMessagingNotificationCopyWithImpl<$Res>
    implements $FirebaseMessagingNotificationCopyWith<$Res> {
  _$FirebaseMessagingNotificationCopyWithImpl(this._self, this._then);

  final FirebaseMessagingNotification _self;
  final $Res Function(FirebaseMessagingNotification) _then;

/// Create a copy of FirebaseMessagingNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = freezed,Object? platform = null,Object? symbol = null,Object? side = null,Object? stopLoss = null,Object? firebaseMessagingToken = freezed,}) {
  return _then(_self.copyWith(
orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,side: null == side ? _self.side : side // ignore: cast_nullable_to_non_nullable
as String,stopLoss: null == stopLoss ? _self.stopLoss : stopLoss // ignore: cast_nullable_to_non_nullable
as double,firebaseMessagingToken: freezed == firebaseMessagingToken ? _self.firebaseMessagingToken : firebaseMessagingToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FirebaseMessagingNotification].
extension FirebaseMessagingNotificationPatterns on FirebaseMessagingNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FirebaseMessagingNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FirebaseMessagingNotification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FirebaseMessagingNotification value)  $default,){
final _that = this;
switch (_that) {
case _FirebaseMessagingNotification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FirebaseMessagingNotification value)?  $default,){
final _that = this;
switch (_that) {
case _FirebaseMessagingNotification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? orderId,  String platform,  String symbol,  String side,  double stopLoss, @JsonKey(name: FirebaseMessagingNotification.kFirebaseMessagingToken)  String? firebaseMessagingToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FirebaseMessagingNotification() when $default != null:
return $default(_that.orderId,_that.platform,_that.symbol,_that.side,_that.stopLoss,_that.firebaseMessagingToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? orderId,  String platform,  String symbol,  String side,  double stopLoss, @JsonKey(name: FirebaseMessagingNotification.kFirebaseMessagingToken)  String? firebaseMessagingToken)  $default,) {final _that = this;
switch (_that) {
case _FirebaseMessagingNotification():
return $default(_that.orderId,_that.platform,_that.symbol,_that.side,_that.stopLoss,_that.firebaseMessagingToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? orderId,  String platform,  String symbol,  String side,  double stopLoss, @JsonKey(name: FirebaseMessagingNotification.kFirebaseMessagingToken)  String? firebaseMessagingToken)?  $default,) {final _that = this;
switch (_that) {
case _FirebaseMessagingNotification() when $default != null:
return $default(_that.orderId,_that.platform,_that.symbol,_that.side,_that.stopLoss,_that.firebaseMessagingToken);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _FirebaseMessagingNotification extends FirebaseMessagingNotification {
  const _FirebaseMessagingNotification({this.orderId, required this.platform, required this.symbol, required this.side, required this.stopLoss, @JsonKey(name: FirebaseMessagingNotification.kFirebaseMessagingToken) this.firebaseMessagingToken}): super._();
  factory _FirebaseMessagingNotification.fromJson(Map<String, dynamic> json) => _$FirebaseMessagingNotificationFromJson(json);

@override final  int? orderId;
@override final  String platform;
@override final  String symbol;
@override final  String side;
@override final  double stopLoss;
@override@JsonKey(name: FirebaseMessagingNotification.kFirebaseMessagingToken) final  String? firebaseMessagingToken;

/// Create a copy of FirebaseMessagingNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FirebaseMessagingNotificationCopyWith<_FirebaseMessagingNotification> get copyWith => __$FirebaseMessagingNotificationCopyWithImpl<_FirebaseMessagingNotification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FirebaseMessagingNotificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FirebaseMessagingNotification&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.side, side) || other.side == side)&&(identical(other.stopLoss, stopLoss) || other.stopLoss == stopLoss)&&(identical(other.firebaseMessagingToken, firebaseMessagingToken) || other.firebaseMessagingToken == firebaseMessagingToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,platform,symbol,side,stopLoss,firebaseMessagingToken);

@override
String toString() {
  return 'FirebaseMessagingNotification(orderId: $orderId, platform: $platform, symbol: $symbol, side: $side, stopLoss: $stopLoss, firebaseMessagingToken: $firebaseMessagingToken)';
}


}

/// @nodoc
abstract mixin class _$FirebaseMessagingNotificationCopyWith<$Res> implements $FirebaseMessagingNotificationCopyWith<$Res> {
  factory _$FirebaseMessagingNotificationCopyWith(_FirebaseMessagingNotification value, $Res Function(_FirebaseMessagingNotification) _then) = __$FirebaseMessagingNotificationCopyWithImpl;
@override @useResult
$Res call({
 int? orderId, String platform, String symbol, String side, double stopLoss,@JsonKey(name: FirebaseMessagingNotification.kFirebaseMessagingToken) String? firebaseMessagingToken
});




}
/// @nodoc
class __$FirebaseMessagingNotificationCopyWithImpl<$Res>
    implements _$FirebaseMessagingNotificationCopyWith<$Res> {
  __$FirebaseMessagingNotificationCopyWithImpl(this._self, this._then);

  final _FirebaseMessagingNotification _self;
  final $Res Function(_FirebaseMessagingNotification) _then;

/// Create a copy of FirebaseMessagingNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = freezed,Object? platform = null,Object? symbol = null,Object? side = null,Object? stopLoss = null,Object? firebaseMessagingToken = freezed,}) {
  return _then(_FirebaseMessagingNotification(
orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,side: null == side ? _self.side : side // ignore: cast_nullable_to_non_nullable
as String,stopLoss: null == stopLoss ? _self.stopLoss : stopLoss // ignore: cast_nullable_to_non_nullable
as double,firebaseMessagingToken: freezed == firebaseMessagingToken ? _self.firebaseMessagingToken : firebaseMessagingToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
