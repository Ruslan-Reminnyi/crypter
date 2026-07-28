// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_recommendation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiRecommendation {

 String get orderType; double? get takeProfit; double? get stopLoss; String get explanation;
/// Create a copy of AiRecommendation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiRecommendationCopyWith<AiRecommendation> get copyWith => _$AiRecommendationCopyWithImpl<AiRecommendation>(this as AiRecommendation, _$identity);

  /// Serializes this AiRecommendation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiRecommendation&&(identical(other.orderType, orderType) || other.orderType == orderType)&&(identical(other.takeProfit, takeProfit) || other.takeProfit == takeProfit)&&(identical(other.stopLoss, stopLoss) || other.stopLoss == stopLoss)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderType,takeProfit,stopLoss,explanation);

@override
String toString() {
  return 'AiRecommendation(orderType: $orderType, takeProfit: $takeProfit, stopLoss: $stopLoss, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class $AiRecommendationCopyWith<$Res>  {
  factory $AiRecommendationCopyWith(AiRecommendation value, $Res Function(AiRecommendation) _then) = _$AiRecommendationCopyWithImpl;
@useResult
$Res call({
 String orderType, double? takeProfit, double? stopLoss, String explanation
});




}
/// @nodoc
class _$AiRecommendationCopyWithImpl<$Res>
    implements $AiRecommendationCopyWith<$Res> {
  _$AiRecommendationCopyWithImpl(this._self, this._then);

  final AiRecommendation _self;
  final $Res Function(AiRecommendation) _then;

/// Create a copy of AiRecommendation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderType = null,Object? takeProfit = freezed,Object? stopLoss = freezed,Object? explanation = null,}) {
  return _then(_self.copyWith(
orderType: null == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as String,takeProfit: freezed == takeProfit ? _self.takeProfit : takeProfit // ignore: cast_nullable_to_non_nullable
as double?,stopLoss: freezed == stopLoss ? _self.stopLoss : stopLoss // ignore: cast_nullable_to_non_nullable
as double?,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AiRecommendation].
extension AiRecommendationPatterns on AiRecommendation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiRecommendation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiRecommendation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiRecommendation value)  $default,){
final _that = this;
switch (_that) {
case _AiRecommendation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiRecommendation value)?  $default,){
final _that = this;
switch (_that) {
case _AiRecommendation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderType,  double? takeProfit,  double? stopLoss,  String explanation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiRecommendation() when $default != null:
return $default(_that.orderType,_that.takeProfit,_that.stopLoss,_that.explanation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderType,  double? takeProfit,  double? stopLoss,  String explanation)  $default,) {final _that = this;
switch (_that) {
case _AiRecommendation():
return $default(_that.orderType,_that.takeProfit,_that.stopLoss,_that.explanation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderType,  double? takeProfit,  double? stopLoss,  String explanation)?  $default,) {final _that = this;
switch (_that) {
case _AiRecommendation() when $default != null:
return $default(_that.orderType,_that.takeProfit,_that.stopLoss,_that.explanation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiRecommendation implements AiRecommendation {
  const _AiRecommendation({required this.orderType, required this.takeProfit, required this.stopLoss, required this.explanation});
  factory _AiRecommendation.fromJson(Map<String, dynamic> json) => _$AiRecommendationFromJson(json);

@override final  String orderType;
@override final  double? takeProfit;
@override final  double? stopLoss;
@override final  String explanation;

/// Create a copy of AiRecommendation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiRecommendationCopyWith<_AiRecommendation> get copyWith => __$AiRecommendationCopyWithImpl<_AiRecommendation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiRecommendationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiRecommendation&&(identical(other.orderType, orderType) || other.orderType == orderType)&&(identical(other.takeProfit, takeProfit) || other.takeProfit == takeProfit)&&(identical(other.stopLoss, stopLoss) || other.stopLoss == stopLoss)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderType,takeProfit,stopLoss,explanation);

@override
String toString() {
  return 'AiRecommendation(orderType: $orderType, takeProfit: $takeProfit, stopLoss: $stopLoss, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class _$AiRecommendationCopyWith<$Res> implements $AiRecommendationCopyWith<$Res> {
  factory _$AiRecommendationCopyWith(_AiRecommendation value, $Res Function(_AiRecommendation) _then) = __$AiRecommendationCopyWithImpl;
@override @useResult
$Res call({
 String orderType, double? takeProfit, double? stopLoss, String explanation
});




}
/// @nodoc
class __$AiRecommendationCopyWithImpl<$Res>
    implements _$AiRecommendationCopyWith<$Res> {
  __$AiRecommendationCopyWithImpl(this._self, this._then);

  final _AiRecommendation _self;
  final $Res Function(_AiRecommendation) _then;

/// Create a copy of AiRecommendation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderType = null,Object? takeProfit = freezed,Object? stopLoss = freezed,Object? explanation = null,}) {
  return _then(_AiRecommendation(
orderType: null == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as String,takeProfit: freezed == takeProfit ? _self.takeProfit : takeProfit // ignore: cast_nullable_to_non_nullable
as double?,stopLoss: freezed == stopLoss ? _self.stopLoss : stopLoss // ignore: cast_nullable_to_non_nullable
as double?,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
