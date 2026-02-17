// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trace_moe_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TraceMoeEntity {

 int get frameCount; List<Result> get result;
/// Create a copy of TraceMoeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TraceMoeEntityCopyWith<TraceMoeEntity> get copyWith => _$TraceMoeEntityCopyWithImpl<TraceMoeEntity>(this as TraceMoeEntity, _$identity);

  /// Serializes this TraceMoeEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TraceMoeEntity&&(identical(other.frameCount, frameCount) || other.frameCount == frameCount)&&const DeepCollectionEquality().equals(other.result, result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frameCount,const DeepCollectionEquality().hash(result));

@override
String toString() {
  return 'TraceMoeEntity(frameCount: $frameCount, result: $result)';
}


}

/// @nodoc
abstract mixin class $TraceMoeEntityCopyWith<$Res>  {
  factory $TraceMoeEntityCopyWith(TraceMoeEntity value, $Res Function(TraceMoeEntity) _then) = _$TraceMoeEntityCopyWithImpl;
@useResult
$Res call({
 int frameCount, List<Result> result
});




}
/// @nodoc
class _$TraceMoeEntityCopyWithImpl<$Res>
    implements $TraceMoeEntityCopyWith<$Res> {
  _$TraceMoeEntityCopyWithImpl(this._self, this._then);

  final TraceMoeEntity _self;
  final $Res Function(TraceMoeEntity) _then;

/// Create a copy of TraceMoeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? frameCount = null,Object? result = null,}) {
  return _then(_self.copyWith(
frameCount: null == frameCount ? _self.frameCount : frameCount // ignore: cast_nullable_to_non_nullable
as int,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as List<Result>,
  ));
}

}


/// Adds pattern-matching-related methods to [TraceMoeEntity].
extension TraceMoeEntityPatterns on TraceMoeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TraceMoeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TraceMoeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TraceMoeEntity value)  $default,){
final _that = this;
switch (_that) {
case _TraceMoeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TraceMoeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TraceMoeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int frameCount,  List<Result> result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TraceMoeEntity() when $default != null:
return $default(_that.frameCount,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int frameCount,  List<Result> result)  $default,) {final _that = this;
switch (_that) {
case _TraceMoeEntity():
return $default(_that.frameCount,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int frameCount,  List<Result> result)?  $default,) {final _that = this;
switch (_that) {
case _TraceMoeEntity() when $default != null:
return $default(_that.frameCount,_that.result);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TraceMoeEntity implements TraceMoeEntity {
  const _TraceMoeEntity({required this.frameCount, required final  List<Result> result}): _result = result;
  factory _TraceMoeEntity.fromJson(Map<String, dynamic> json) => _$TraceMoeEntityFromJson(json);

@override final  int frameCount;
 final  List<Result> _result;
@override List<Result> get result {
  if (_result is EqualUnmodifiableListView) return _result;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_result);
}


/// Create a copy of TraceMoeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TraceMoeEntityCopyWith<_TraceMoeEntity> get copyWith => __$TraceMoeEntityCopyWithImpl<_TraceMoeEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TraceMoeEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TraceMoeEntity&&(identical(other.frameCount, frameCount) || other.frameCount == frameCount)&&const DeepCollectionEquality().equals(other._result, _result));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,frameCount,const DeepCollectionEquality().hash(_result));

@override
String toString() {
  return 'TraceMoeEntity(frameCount: $frameCount, result: $result)';
}


}

/// @nodoc
abstract mixin class _$TraceMoeEntityCopyWith<$Res> implements $TraceMoeEntityCopyWith<$Res> {
  factory _$TraceMoeEntityCopyWith(_TraceMoeEntity value, $Res Function(_TraceMoeEntity) _then) = __$TraceMoeEntityCopyWithImpl;
@override @useResult
$Res call({
 int frameCount, List<Result> result
});




}
/// @nodoc
class __$TraceMoeEntityCopyWithImpl<$Res>
    implements _$TraceMoeEntityCopyWith<$Res> {
  __$TraceMoeEntityCopyWithImpl(this._self, this._then);

  final _TraceMoeEntity _self;
  final $Res Function(_TraceMoeEntity) _then;

/// Create a copy of TraceMoeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? frameCount = null,Object? result = null,}) {
  return _then(_TraceMoeEntity(
frameCount: null == frameCount ? _self.frameCount : frameCount // ignore: cast_nullable_to_non_nullable
as int,result: null == result ? _self._result : result // ignore: cast_nullable_to_non_nullable
as List<Result>,
  ));
}


}


/// @nodoc
mixin _$Result {

 int get anilist; int get episode; double get similarity; String get filename; String get video; String get image;
/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultCopyWith<Result> get copyWith => _$ResultCopyWithImpl<Result>(this as Result, _$identity);

  /// Serializes this Result to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result&&(identical(other.anilist, anilist) || other.anilist == anilist)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.similarity, similarity) || other.similarity == similarity)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.video, video) || other.video == video)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anilist,episode,similarity,filename,video,image);

@override
String toString() {
  return 'Result(anilist: $anilist, episode: $episode, similarity: $similarity, filename: $filename, video: $video, image: $image)';
}


}

/// @nodoc
abstract mixin class $ResultCopyWith<$Res>  {
  factory $ResultCopyWith(Result value, $Res Function(Result) _then) = _$ResultCopyWithImpl;
@useResult
$Res call({
 int anilist, int episode, double similarity, String filename, String video, String image
});




}
/// @nodoc
class _$ResultCopyWithImpl<$Res>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._self, this._then);

  final Result _self;
  final $Res Function(Result) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? anilist = null,Object? episode = null,Object? similarity = null,Object? filename = null,Object? video = null,Object? image = null,}) {
  return _then(_self.copyWith(
anilist: null == anilist ? _self.anilist : anilist // ignore: cast_nullable_to_non_nullable
as int,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as int,similarity: null == similarity ? _self.similarity : similarity // ignore: cast_nullable_to_non_nullable
as double,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,video: null == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Result].
extension ResultPatterns on Result {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Result value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Result() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Result value)  $default,){
final _that = this;
switch (_that) {
case _Result():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Result value)?  $default,){
final _that = this;
switch (_that) {
case _Result() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int anilist,  int episode,  double similarity,  String filename,  String video,  String image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Result() when $default != null:
return $default(_that.anilist,_that.episode,_that.similarity,_that.filename,_that.video,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int anilist,  int episode,  double similarity,  String filename,  String video,  String image)  $default,) {final _that = this;
switch (_that) {
case _Result():
return $default(_that.anilist,_that.episode,_that.similarity,_that.filename,_that.video,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int anilist,  int episode,  double similarity,  String filename,  String video,  String image)?  $default,) {final _that = this;
switch (_that) {
case _Result() when $default != null:
return $default(_that.anilist,_that.episode,_that.similarity,_that.filename,_that.video,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Result implements Result {
  const _Result({required this.anilist, required this.episode, required this.similarity, required this.filename, required this.video, required this.image});
  factory _Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

@override final  int anilist;
@override final  int episode;
@override final  double similarity;
@override final  String filename;
@override final  String video;
@override final  String image;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultCopyWith<_Result> get copyWith => __$ResultCopyWithImpl<_Result>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Result&&(identical(other.anilist, anilist) || other.anilist == anilist)&&(identical(other.episode, episode) || other.episode == episode)&&(identical(other.similarity, similarity) || other.similarity == similarity)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.video, video) || other.video == video)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,anilist,episode,similarity,filename,video,image);

@override
String toString() {
  return 'Result(anilist: $anilist, episode: $episode, similarity: $similarity, filename: $filename, video: $video, image: $image)';
}


}

/// @nodoc
abstract mixin class _$ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$ResultCopyWith(_Result value, $Res Function(_Result) _then) = __$ResultCopyWithImpl;
@override @useResult
$Res call({
 int anilist, int episode, double similarity, String filename, String video, String image
});




}
/// @nodoc
class __$ResultCopyWithImpl<$Res>
    implements _$ResultCopyWith<$Res> {
  __$ResultCopyWithImpl(this._self, this._then);

  final _Result _self;
  final $Res Function(_Result) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? anilist = null,Object? episode = null,Object? similarity = null,Object? filename = null,Object? video = null,Object? image = null,}) {
  return _then(_Result(
anilist: null == anilist ? _self.anilist : anilist // ignore: cast_nullable_to_non_nullable
as int,episode: null == episode ? _self.episode : episode // ignore: cast_nullable_to_non_nullable
as int,similarity: null == similarity ? _self.similarity : similarity // ignore: cast_nullable_to_non_nullable
as double,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,video: null == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
