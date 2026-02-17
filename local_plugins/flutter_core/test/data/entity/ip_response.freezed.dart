// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ip_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IpResponse {

 String get origin;
/// Create a copy of IpResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IpResponseCopyWith<IpResponse> get copyWith => _$IpResponseCopyWithImpl<IpResponse>(this as IpResponse, _$identity);

  /// Serializes this IpResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IpResponse&&(identical(other.origin, origin) || other.origin == origin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,origin);

@override
String toString() {
  return 'IpResponse(origin: $origin)';
}


}

/// @nodoc
abstract mixin class $IpResponseCopyWith<$Res>  {
  factory $IpResponseCopyWith(IpResponse value, $Res Function(IpResponse) _then) = _$IpResponseCopyWithImpl;
@useResult
$Res call({
 String origin
});




}
/// @nodoc
class _$IpResponseCopyWithImpl<$Res>
    implements $IpResponseCopyWith<$Res> {
  _$IpResponseCopyWithImpl(this._self, this._then);

  final IpResponse _self;
  final $Res Function(IpResponse) _then;

/// Create a copy of IpResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? origin = null,}) {
  return _then(_self.copyWith(
origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IpResponse].
extension IpResponsePatterns on IpResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IpResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IpResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IpResponse value)  $default,){
final _that = this;
switch (_that) {
case _IpResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IpResponse value)?  $default,){
final _that = this;
switch (_that) {
case _IpResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String origin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IpResponse() when $default != null:
return $default(_that.origin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String origin)  $default,) {final _that = this;
switch (_that) {
case _IpResponse():
return $default(_that.origin);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String origin)?  $default,) {final _that = this;
switch (_that) {
case _IpResponse() when $default != null:
return $default(_that.origin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IpResponse implements IpResponse {
  const _IpResponse({required this.origin});
  factory _IpResponse.fromJson(Map<String, dynamic> json) => _$IpResponseFromJson(json);

@override final  String origin;

/// Create a copy of IpResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IpResponseCopyWith<_IpResponse> get copyWith => __$IpResponseCopyWithImpl<_IpResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IpResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IpResponse&&(identical(other.origin, origin) || other.origin == origin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,origin);

@override
String toString() {
  return 'IpResponse(origin: $origin)';
}


}

/// @nodoc
abstract mixin class _$IpResponseCopyWith<$Res> implements $IpResponseCopyWith<$Res> {
  factory _$IpResponseCopyWith(_IpResponse value, $Res Function(_IpResponse) _then) = __$IpResponseCopyWithImpl;
@override @useResult
$Res call({
 String origin
});




}
/// @nodoc
class __$IpResponseCopyWithImpl<$Res>
    implements _$IpResponseCopyWith<$Res> {
  __$IpResponseCopyWithImpl(this._self, this._then);

  final _IpResponse _self;
  final $Res Function(_IpResponse) _then;

/// Create a copy of IpResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? origin = null,}) {
  return _then(_IpResponse(
origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
