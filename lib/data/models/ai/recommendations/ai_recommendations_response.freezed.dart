// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_recommendations_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiRecommendationsResponse {

 String get title; String get description; List<AiRecommendation> get recommendations;
/// Create a copy of AiRecommendationsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiRecommendationsResponseCopyWith<AiRecommendationsResponse> get copyWith => _$AiRecommendationsResponseCopyWithImpl<AiRecommendationsResponse>(this as AiRecommendationsResponse, _$identity);

  /// Serializes this AiRecommendationsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiRecommendationsResponse&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.recommendations, recommendations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,const DeepCollectionEquality().hash(recommendations));

@override
String toString() {
  return 'AiRecommendationsResponse(title: $title, description: $description, recommendations: $recommendations)';
}


}

/// @nodoc
abstract mixin class $AiRecommendationsResponseCopyWith<$Res>  {
  factory $AiRecommendationsResponseCopyWith(AiRecommendationsResponse value, $Res Function(AiRecommendationsResponse) _then) = _$AiRecommendationsResponseCopyWithImpl;
@useResult
$Res call({
 String title, String description, List<AiRecommendation> recommendations
});




}
/// @nodoc
class _$AiRecommendationsResponseCopyWithImpl<$Res>
    implements $AiRecommendationsResponseCopyWith<$Res> {
  _$AiRecommendationsResponseCopyWithImpl(this._self, this._then);

  final AiRecommendationsResponse _self;
  final $Res Function(AiRecommendationsResponse) _then;

/// Create a copy of AiRecommendationsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? recommendations = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,recommendations: null == recommendations ? _self.recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as List<AiRecommendation>,
  ));
}

}


/// Adds pattern-matching-related methods to [AiRecommendationsResponse].
extension AiRecommendationsResponsePatterns on AiRecommendationsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiRecommendationsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiRecommendationsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiRecommendationsResponse value)  $default,){
final _that = this;
switch (_that) {
case _AiRecommendationsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiRecommendationsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AiRecommendationsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  List<AiRecommendation> recommendations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiRecommendationsResponse() when $default != null:
return $default(_that.title,_that.description,_that.recommendations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  List<AiRecommendation> recommendations)  $default,) {final _that = this;
switch (_that) {
case _AiRecommendationsResponse():
return $default(_that.title,_that.description,_that.recommendations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  List<AiRecommendation> recommendations)?  $default,) {final _that = this;
switch (_that) {
case _AiRecommendationsResponse() when $default != null:
return $default(_that.title,_that.description,_that.recommendations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiRecommendationsResponse implements AiRecommendationsResponse {
  const _AiRecommendationsResponse({required this.title, required this.description, required final  List<AiRecommendation> recommendations}): _recommendations = recommendations;
  factory _AiRecommendationsResponse.fromJson(Map<String, dynamic> json) => _$AiRecommendationsResponseFromJson(json);

@override final  String title;
@override final  String description;
 final  List<AiRecommendation> _recommendations;
@override List<AiRecommendation> get recommendations {
  if (_recommendations is EqualUnmodifiableListView) return _recommendations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recommendations);
}


/// Create a copy of AiRecommendationsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiRecommendationsResponseCopyWith<_AiRecommendationsResponse> get copyWith => __$AiRecommendationsResponseCopyWithImpl<_AiRecommendationsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiRecommendationsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiRecommendationsResponse&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._recommendations, _recommendations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,const DeepCollectionEquality().hash(_recommendations));

@override
String toString() {
  return 'AiRecommendationsResponse(title: $title, description: $description, recommendations: $recommendations)';
}


}

/// @nodoc
abstract mixin class _$AiRecommendationsResponseCopyWith<$Res> implements $AiRecommendationsResponseCopyWith<$Res> {
  factory _$AiRecommendationsResponseCopyWith(_AiRecommendationsResponse value, $Res Function(_AiRecommendationsResponse) _then) = __$AiRecommendationsResponseCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, List<AiRecommendation> recommendations
});




}
/// @nodoc
class __$AiRecommendationsResponseCopyWithImpl<$Res>
    implements _$AiRecommendationsResponseCopyWith<$Res> {
  __$AiRecommendationsResponseCopyWithImpl(this._self, this._then);

  final _AiRecommendationsResponse _self;
  final $Res Function(_AiRecommendationsResponse) _then;

/// Create a copy of AiRecommendationsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? recommendations = null,}) {
  return _then(_AiRecommendationsResponse(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,recommendations: null == recommendations ? _self._recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as List<AiRecommendation>,
  ));
}


}

// dart format on
