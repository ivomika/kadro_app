// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anilist_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnilistResponse {

 AnilistData get data;
/// Create a copy of AnilistResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnilistResponseCopyWith<AnilistResponse> get copyWith => _$AnilistResponseCopyWithImpl<AnilistResponse>(this as AnilistResponse, _$identity);

  /// Serializes this AnilistResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnilistResponse&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AnilistResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class $AnilistResponseCopyWith<$Res>  {
  factory $AnilistResponseCopyWith(AnilistResponse value, $Res Function(AnilistResponse) _then) = _$AnilistResponseCopyWithImpl;
@useResult
$Res call({
 AnilistData data
});


$AnilistDataCopyWith<$Res> get data;

}
/// @nodoc
class _$AnilistResponseCopyWithImpl<$Res>
    implements $AnilistResponseCopyWith<$Res> {
  _$AnilistResponseCopyWithImpl(this._self, this._then);

  final AnilistResponse _self;
  final $Res Function(AnilistResponse) _then;

/// Create a copy of AnilistResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AnilistData,
  ));
}
/// Create a copy of AnilistResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnilistDataCopyWith<$Res> get data {
  
  return $AnilistDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnilistResponse].
extension AnilistResponsePatterns on AnilistResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnilistResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnilistResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnilistResponse value)  $default,){
final _that = this;
switch (_that) {
case _AnilistResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnilistResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AnilistResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AnilistData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnilistResponse() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AnilistData data)  $default,) {final _that = this;
switch (_that) {
case _AnilistResponse():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AnilistData data)?  $default,) {final _that = this;
switch (_that) {
case _AnilistResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnilistResponse implements AnilistResponse {
  const _AnilistResponse({required this.data});
  factory _AnilistResponse.fromJson(Map<String, dynamic> json) => _$AnilistResponseFromJson(json);

@override final  AnilistData data;

/// Create a copy of AnilistResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnilistResponseCopyWith<_AnilistResponse> get copyWith => __$AnilistResponseCopyWithImpl<_AnilistResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnilistResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnilistResponse&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AnilistResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class _$AnilistResponseCopyWith<$Res> implements $AnilistResponseCopyWith<$Res> {
  factory _$AnilistResponseCopyWith(_AnilistResponse value, $Res Function(_AnilistResponse) _then) = __$AnilistResponseCopyWithImpl;
@override @useResult
$Res call({
 AnilistData data
});


@override $AnilistDataCopyWith<$Res> get data;

}
/// @nodoc
class __$AnilistResponseCopyWithImpl<$Res>
    implements _$AnilistResponseCopyWith<$Res> {
  __$AnilistResponseCopyWithImpl(this._self, this._then);

  final _AnilistResponse _self;
  final $Res Function(_AnilistResponse) _then;

/// Create a copy of AnilistResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_AnilistResponse(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AnilistData,
  ));
}

/// Create a copy of AnilistResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnilistDataCopyWith<$Res> get data {
  
  return $AnilistDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$AnilistData {

@JsonKey(name: 'Media') AnilistMedia get media;
/// Create a copy of AnilistData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnilistDataCopyWith<AnilistData> get copyWith => _$AnilistDataCopyWithImpl<AnilistData>(this as AnilistData, _$identity);

  /// Serializes this AnilistData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnilistData&&(identical(other.media, media) || other.media == media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,media);

@override
String toString() {
  return 'AnilistData(media: $media)';
}


}

/// @nodoc
abstract mixin class $AnilistDataCopyWith<$Res>  {
  factory $AnilistDataCopyWith(AnilistData value, $Res Function(AnilistData) _then) = _$AnilistDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Media') AnilistMedia media
});


$AnilistMediaCopyWith<$Res> get media;

}
/// @nodoc
class _$AnilistDataCopyWithImpl<$Res>
    implements $AnilistDataCopyWith<$Res> {
  _$AnilistDataCopyWithImpl(this._self, this._then);

  final AnilistData _self;
  final $Res Function(AnilistData) _then;

/// Create a copy of AnilistData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? media = null,}) {
  return _then(_self.copyWith(
media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as AnilistMedia,
  ));
}
/// Create a copy of AnilistData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnilistMediaCopyWith<$Res> get media {
  
  return $AnilistMediaCopyWith<$Res>(_self.media, (value) {
    return _then(_self.copyWith(media: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnilistData].
extension AnilistDataPatterns on AnilistData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnilistData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnilistData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnilistData value)  $default,){
final _that = this;
switch (_that) {
case _AnilistData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnilistData value)?  $default,){
final _that = this;
switch (_that) {
case _AnilistData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Media')  AnilistMedia media)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnilistData() when $default != null:
return $default(_that.media);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Media')  AnilistMedia media)  $default,) {final _that = this;
switch (_that) {
case _AnilistData():
return $default(_that.media);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Media')  AnilistMedia media)?  $default,) {final _that = this;
switch (_that) {
case _AnilistData() when $default != null:
return $default(_that.media);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnilistData implements AnilistData {
  const _AnilistData({@JsonKey(name: 'Media') required this.media});
  factory _AnilistData.fromJson(Map<String, dynamic> json) => _$AnilistDataFromJson(json);

@override@JsonKey(name: 'Media') final  AnilistMedia media;

/// Create a copy of AnilistData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnilistDataCopyWith<_AnilistData> get copyWith => __$AnilistDataCopyWithImpl<_AnilistData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnilistDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnilistData&&(identical(other.media, media) || other.media == media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,media);

@override
String toString() {
  return 'AnilistData(media: $media)';
}


}

/// @nodoc
abstract mixin class _$AnilistDataCopyWith<$Res> implements $AnilistDataCopyWith<$Res> {
  factory _$AnilistDataCopyWith(_AnilistData value, $Res Function(_AnilistData) _then) = __$AnilistDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Media') AnilistMedia media
});


@override $AnilistMediaCopyWith<$Res> get media;

}
/// @nodoc
class __$AnilistDataCopyWithImpl<$Res>
    implements _$AnilistDataCopyWith<$Res> {
  __$AnilistDataCopyWithImpl(this._self, this._then);

  final _AnilistData _self;
  final $Res Function(_AnilistData) _then;

/// Create a copy of AnilistData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? media = null,}) {
  return _then(_AnilistData(
media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as AnilistMedia,
  ));
}

/// Create a copy of AnilistData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnilistMediaCopyWith<$Res> get media {
  
  return $AnilistMediaCopyWith<$Res>(_self.media, (value) {
    return _then(_self.copyWith(media: value));
  });
}
}


/// @nodoc
mixin _$AnilistMedia {

 int get id; int? get idMal; String? get type; AnilistTitle get title; String? get description; String? get format; String? get status; int? get episodes; int? get duration; String? get season; int? get seasonYear; int? get averageScore; int? get meanScore; int? get popularity; int? get trending; int? get favourites; String? get countryOfOrigin; String? get source; bool? get isLicensed; List<String> get genres; List<String> get synonyms; List<AnilistTag> get tags; List<AnilistRanking> get rankings; AnilistCoverImage get coverImage; String? get bannerImage; AnilistFuzzyDate get startDate; AnilistFuzzyDate get endDate; AnilistStudios get studios; String? get siteUrl;
/// Create a copy of AnilistMedia
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnilistMediaCopyWith<AnilistMedia> get copyWith => _$AnilistMediaCopyWithImpl<AnilistMedia>(this as AnilistMedia, _$identity);

  /// Serializes this AnilistMedia to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnilistMedia&&(identical(other.id, id) || other.id == id)&&(identical(other.idMal, idMal) || other.idMal == idMal)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.format, format) || other.format == format)&&(identical(other.status, status) || other.status == status)&&(identical(other.episodes, episodes) || other.episodes == episodes)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.season, season) || other.season == season)&&(identical(other.seasonYear, seasonYear) || other.seasonYear == seasonYear)&&(identical(other.averageScore, averageScore) || other.averageScore == averageScore)&&(identical(other.meanScore, meanScore) || other.meanScore == meanScore)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.trending, trending) || other.trending == trending)&&(identical(other.favourites, favourites) || other.favourites == favourites)&&(identical(other.countryOfOrigin, countryOfOrigin) || other.countryOfOrigin == countryOfOrigin)&&(identical(other.source, source) || other.source == source)&&(identical(other.isLicensed, isLicensed) || other.isLicensed == isLicensed)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.synonyms, synonyms)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.rankings, rankings)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&(identical(other.bannerImage, bannerImage) || other.bannerImage == bannerImage)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.studios, studios) || other.studios == studios)&&(identical(other.siteUrl, siteUrl) || other.siteUrl == siteUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,idMal,type,title,description,format,status,episodes,duration,season,seasonYear,averageScore,meanScore,popularity,trending,favourites,countryOfOrigin,source,isLicensed,const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(synonyms),const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(rankings),coverImage,bannerImage,startDate,endDate,studios,siteUrl]);

@override
String toString() {
  return 'AnilistMedia(id: $id, idMal: $idMal, type: $type, title: $title, description: $description, format: $format, status: $status, episodes: $episodes, duration: $duration, season: $season, seasonYear: $seasonYear, averageScore: $averageScore, meanScore: $meanScore, popularity: $popularity, trending: $trending, favourites: $favourites, countryOfOrigin: $countryOfOrigin, source: $source, isLicensed: $isLicensed, genres: $genres, synonyms: $synonyms, tags: $tags, rankings: $rankings, coverImage: $coverImage, bannerImage: $bannerImage, startDate: $startDate, endDate: $endDate, studios: $studios, siteUrl: $siteUrl)';
}


}

/// @nodoc
abstract mixin class $AnilistMediaCopyWith<$Res>  {
  factory $AnilistMediaCopyWith(AnilistMedia value, $Res Function(AnilistMedia) _then) = _$AnilistMediaCopyWithImpl;
@useResult
$Res call({
 int id, int? idMal, String? type, AnilistTitle title, String? description, String? format, String? status, int? episodes, int? duration, String? season, int? seasonYear, int? averageScore, int? meanScore, int? popularity, int? trending, int? favourites, String? countryOfOrigin, String? source, bool? isLicensed, List<String> genres, List<String> synonyms, List<AnilistTag> tags, List<AnilistRanking> rankings, AnilistCoverImage coverImage, String? bannerImage, AnilistFuzzyDate startDate, AnilistFuzzyDate endDate, AnilistStudios studios, String? siteUrl
});


$AnilistTitleCopyWith<$Res> get title;$AnilistCoverImageCopyWith<$Res> get coverImage;$AnilistFuzzyDateCopyWith<$Res> get startDate;$AnilistFuzzyDateCopyWith<$Res> get endDate;$AnilistStudiosCopyWith<$Res> get studios;

}
/// @nodoc
class _$AnilistMediaCopyWithImpl<$Res>
    implements $AnilistMediaCopyWith<$Res> {
  _$AnilistMediaCopyWithImpl(this._self, this._then);

  final AnilistMedia _self;
  final $Res Function(AnilistMedia) _then;

/// Create a copy of AnilistMedia
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? idMal = freezed,Object? type = freezed,Object? title = null,Object? description = freezed,Object? format = freezed,Object? status = freezed,Object? episodes = freezed,Object? duration = freezed,Object? season = freezed,Object? seasonYear = freezed,Object? averageScore = freezed,Object? meanScore = freezed,Object? popularity = freezed,Object? trending = freezed,Object? favourites = freezed,Object? countryOfOrigin = freezed,Object? source = freezed,Object? isLicensed = freezed,Object? genres = null,Object? synonyms = null,Object? tags = null,Object? rankings = null,Object? coverImage = null,Object? bannerImage = freezed,Object? startDate = null,Object? endDate = null,Object? studios = null,Object? siteUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,idMal: freezed == idMal ? _self.idMal : idMal // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as AnilistTitle,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,episodes: freezed == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as int?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String?,seasonYear: freezed == seasonYear ? _self.seasonYear : seasonYear // ignore: cast_nullable_to_non_nullable
as int?,averageScore: freezed == averageScore ? _self.averageScore : averageScore // ignore: cast_nullable_to_non_nullable
as int?,meanScore: freezed == meanScore ? _self.meanScore : meanScore // ignore: cast_nullable_to_non_nullable
as int?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int?,trending: freezed == trending ? _self.trending : trending // ignore: cast_nullable_to_non_nullable
as int?,favourites: freezed == favourites ? _self.favourites : favourites // ignore: cast_nullable_to_non_nullable
as int?,countryOfOrigin: freezed == countryOfOrigin ? _self.countryOfOrigin : countryOfOrigin // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,isLicensed: freezed == isLicensed ? _self.isLicensed : isLicensed // ignore: cast_nullable_to_non_nullable
as bool?,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,synonyms: null == synonyms ? _self.synonyms : synonyms // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<AnilistTag>,rankings: null == rankings ? _self.rankings : rankings // ignore: cast_nullable_to_non_nullable
as List<AnilistRanking>,coverImage: null == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as AnilistCoverImage,bannerImage: freezed == bannerImage ? _self.bannerImage : bannerImage // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as AnilistFuzzyDate,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as AnilistFuzzyDate,studios: null == studios ? _self.studios : studios // ignore: cast_nullable_to_non_nullable
as AnilistStudios,siteUrl: freezed == siteUrl ? _self.siteUrl : siteUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AnilistMedia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnilistTitleCopyWith<$Res> get title {
  
  return $AnilistTitleCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of AnilistMedia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnilistCoverImageCopyWith<$Res> get coverImage {
  
  return $AnilistCoverImageCopyWith<$Res>(_self.coverImage, (value) {
    return _then(_self.copyWith(coverImage: value));
  });
}/// Create a copy of AnilistMedia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnilistFuzzyDateCopyWith<$Res> get startDate {
  
  return $AnilistFuzzyDateCopyWith<$Res>(_self.startDate, (value) {
    return _then(_self.copyWith(startDate: value));
  });
}/// Create a copy of AnilistMedia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnilistFuzzyDateCopyWith<$Res> get endDate {
  
  return $AnilistFuzzyDateCopyWith<$Res>(_self.endDate, (value) {
    return _then(_self.copyWith(endDate: value));
  });
}/// Create a copy of AnilistMedia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnilistStudiosCopyWith<$Res> get studios {
  
  return $AnilistStudiosCopyWith<$Res>(_self.studios, (value) {
    return _then(_self.copyWith(studios: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnilistMedia].
extension AnilistMediaPatterns on AnilistMedia {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnilistMedia value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnilistMedia() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnilistMedia value)  $default,){
final _that = this;
switch (_that) {
case _AnilistMedia():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnilistMedia value)?  $default,){
final _that = this;
switch (_that) {
case _AnilistMedia() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int? idMal,  String? type,  AnilistTitle title,  String? description,  String? format,  String? status,  int? episodes,  int? duration,  String? season,  int? seasonYear,  int? averageScore,  int? meanScore,  int? popularity,  int? trending,  int? favourites,  String? countryOfOrigin,  String? source,  bool? isLicensed,  List<String> genres,  List<String> synonyms,  List<AnilistTag> tags,  List<AnilistRanking> rankings,  AnilistCoverImage coverImage,  String? bannerImage,  AnilistFuzzyDate startDate,  AnilistFuzzyDate endDate,  AnilistStudios studios,  String? siteUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnilistMedia() when $default != null:
return $default(_that.id,_that.idMal,_that.type,_that.title,_that.description,_that.format,_that.status,_that.episodes,_that.duration,_that.season,_that.seasonYear,_that.averageScore,_that.meanScore,_that.popularity,_that.trending,_that.favourites,_that.countryOfOrigin,_that.source,_that.isLicensed,_that.genres,_that.synonyms,_that.tags,_that.rankings,_that.coverImage,_that.bannerImage,_that.startDate,_that.endDate,_that.studios,_that.siteUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int? idMal,  String? type,  AnilistTitle title,  String? description,  String? format,  String? status,  int? episodes,  int? duration,  String? season,  int? seasonYear,  int? averageScore,  int? meanScore,  int? popularity,  int? trending,  int? favourites,  String? countryOfOrigin,  String? source,  bool? isLicensed,  List<String> genres,  List<String> synonyms,  List<AnilistTag> tags,  List<AnilistRanking> rankings,  AnilistCoverImage coverImage,  String? bannerImage,  AnilistFuzzyDate startDate,  AnilistFuzzyDate endDate,  AnilistStudios studios,  String? siteUrl)  $default,) {final _that = this;
switch (_that) {
case _AnilistMedia():
return $default(_that.id,_that.idMal,_that.type,_that.title,_that.description,_that.format,_that.status,_that.episodes,_that.duration,_that.season,_that.seasonYear,_that.averageScore,_that.meanScore,_that.popularity,_that.trending,_that.favourites,_that.countryOfOrigin,_that.source,_that.isLicensed,_that.genres,_that.synonyms,_that.tags,_that.rankings,_that.coverImage,_that.bannerImage,_that.startDate,_that.endDate,_that.studios,_that.siteUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int? idMal,  String? type,  AnilistTitle title,  String? description,  String? format,  String? status,  int? episodes,  int? duration,  String? season,  int? seasonYear,  int? averageScore,  int? meanScore,  int? popularity,  int? trending,  int? favourites,  String? countryOfOrigin,  String? source,  bool? isLicensed,  List<String> genres,  List<String> synonyms,  List<AnilistTag> tags,  List<AnilistRanking> rankings,  AnilistCoverImage coverImage,  String? bannerImage,  AnilistFuzzyDate startDate,  AnilistFuzzyDate endDate,  AnilistStudios studios,  String? siteUrl)?  $default,) {final _that = this;
switch (_that) {
case _AnilistMedia() when $default != null:
return $default(_that.id,_that.idMal,_that.type,_that.title,_that.description,_that.format,_that.status,_that.episodes,_that.duration,_that.season,_that.seasonYear,_that.averageScore,_that.meanScore,_that.popularity,_that.trending,_that.favourites,_that.countryOfOrigin,_that.source,_that.isLicensed,_that.genres,_that.synonyms,_that.tags,_that.rankings,_that.coverImage,_that.bannerImage,_that.startDate,_that.endDate,_that.studios,_that.siteUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnilistMedia implements AnilistMedia {
  const _AnilistMedia({required this.id, required this.idMal, required this.type, required this.title, required this.description, required this.format, required this.status, required this.episodes, required this.duration, required this.season, required this.seasonYear, required this.averageScore, required this.meanScore, required this.popularity, required this.trending, required this.favourites, required this.countryOfOrigin, required this.source, required this.isLicensed, required final  List<String> genres, required final  List<String> synonyms, required final  List<AnilistTag> tags, required final  List<AnilistRanking> rankings, required this.coverImage, required this.bannerImage, required this.startDate, required this.endDate, required this.studios, required this.siteUrl}): _genres = genres,_synonyms = synonyms,_tags = tags,_rankings = rankings;
  factory _AnilistMedia.fromJson(Map<String, dynamic> json) => _$AnilistMediaFromJson(json);

@override final  int id;
@override final  int? idMal;
@override final  String? type;
@override final  AnilistTitle title;
@override final  String? description;
@override final  String? format;
@override final  String? status;
@override final  int? episodes;
@override final  int? duration;
@override final  String? season;
@override final  int? seasonYear;
@override final  int? averageScore;
@override final  int? meanScore;
@override final  int? popularity;
@override final  int? trending;
@override final  int? favourites;
@override final  String? countryOfOrigin;
@override final  String? source;
@override final  bool? isLicensed;
 final  List<String> _genres;
@override List<String> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

 final  List<String> _synonyms;
@override List<String> get synonyms {
  if (_synonyms is EqualUnmodifiableListView) return _synonyms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_synonyms);
}

 final  List<AnilistTag> _tags;
@override List<AnilistTag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<AnilistRanking> _rankings;
@override List<AnilistRanking> get rankings {
  if (_rankings is EqualUnmodifiableListView) return _rankings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rankings);
}

@override final  AnilistCoverImage coverImage;
@override final  String? bannerImage;
@override final  AnilistFuzzyDate startDate;
@override final  AnilistFuzzyDate endDate;
@override final  AnilistStudios studios;
@override final  String? siteUrl;

/// Create a copy of AnilistMedia
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnilistMediaCopyWith<_AnilistMedia> get copyWith => __$AnilistMediaCopyWithImpl<_AnilistMedia>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnilistMediaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnilistMedia&&(identical(other.id, id) || other.id == id)&&(identical(other.idMal, idMal) || other.idMal == idMal)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.format, format) || other.format == format)&&(identical(other.status, status) || other.status == status)&&(identical(other.episodes, episodes) || other.episodes == episodes)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.season, season) || other.season == season)&&(identical(other.seasonYear, seasonYear) || other.seasonYear == seasonYear)&&(identical(other.averageScore, averageScore) || other.averageScore == averageScore)&&(identical(other.meanScore, meanScore) || other.meanScore == meanScore)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.trending, trending) || other.trending == trending)&&(identical(other.favourites, favourites) || other.favourites == favourites)&&(identical(other.countryOfOrigin, countryOfOrigin) || other.countryOfOrigin == countryOfOrigin)&&(identical(other.source, source) || other.source == source)&&(identical(other.isLicensed, isLicensed) || other.isLicensed == isLicensed)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._synonyms, _synonyms)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._rankings, _rankings)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&(identical(other.bannerImage, bannerImage) || other.bannerImage == bannerImage)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.studios, studios) || other.studios == studios)&&(identical(other.siteUrl, siteUrl) || other.siteUrl == siteUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,idMal,type,title,description,format,status,episodes,duration,season,seasonYear,averageScore,meanScore,popularity,trending,favourites,countryOfOrigin,source,isLicensed,const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_synonyms),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_rankings),coverImage,bannerImage,startDate,endDate,studios,siteUrl]);

@override
String toString() {
  return 'AnilistMedia(id: $id, idMal: $idMal, type: $type, title: $title, description: $description, format: $format, status: $status, episodes: $episodes, duration: $duration, season: $season, seasonYear: $seasonYear, averageScore: $averageScore, meanScore: $meanScore, popularity: $popularity, trending: $trending, favourites: $favourites, countryOfOrigin: $countryOfOrigin, source: $source, isLicensed: $isLicensed, genres: $genres, synonyms: $synonyms, tags: $tags, rankings: $rankings, coverImage: $coverImage, bannerImage: $bannerImage, startDate: $startDate, endDate: $endDate, studios: $studios, siteUrl: $siteUrl)';
}


}

/// @nodoc
abstract mixin class _$AnilistMediaCopyWith<$Res> implements $AnilistMediaCopyWith<$Res> {
  factory _$AnilistMediaCopyWith(_AnilistMedia value, $Res Function(_AnilistMedia) _then) = __$AnilistMediaCopyWithImpl;
@override @useResult
$Res call({
 int id, int? idMal, String? type, AnilistTitle title, String? description, String? format, String? status, int? episodes, int? duration, String? season, int? seasonYear, int? averageScore, int? meanScore, int? popularity, int? trending, int? favourites, String? countryOfOrigin, String? source, bool? isLicensed, List<String> genres, List<String> synonyms, List<AnilistTag> tags, List<AnilistRanking> rankings, AnilistCoverImage coverImage, String? bannerImage, AnilistFuzzyDate startDate, AnilistFuzzyDate endDate, AnilistStudios studios, String? siteUrl
});


@override $AnilistTitleCopyWith<$Res> get title;@override $AnilistCoverImageCopyWith<$Res> get coverImage;@override $AnilistFuzzyDateCopyWith<$Res> get startDate;@override $AnilistFuzzyDateCopyWith<$Res> get endDate;@override $AnilistStudiosCopyWith<$Res> get studios;

}
/// @nodoc
class __$AnilistMediaCopyWithImpl<$Res>
    implements _$AnilistMediaCopyWith<$Res> {
  __$AnilistMediaCopyWithImpl(this._self, this._then);

  final _AnilistMedia _self;
  final $Res Function(_AnilistMedia) _then;

/// Create a copy of AnilistMedia
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? idMal = freezed,Object? type = freezed,Object? title = null,Object? description = freezed,Object? format = freezed,Object? status = freezed,Object? episodes = freezed,Object? duration = freezed,Object? season = freezed,Object? seasonYear = freezed,Object? averageScore = freezed,Object? meanScore = freezed,Object? popularity = freezed,Object? trending = freezed,Object? favourites = freezed,Object? countryOfOrigin = freezed,Object? source = freezed,Object? isLicensed = freezed,Object? genres = null,Object? synonyms = null,Object? tags = null,Object? rankings = null,Object? coverImage = null,Object? bannerImage = freezed,Object? startDate = null,Object? endDate = null,Object? studios = null,Object? siteUrl = freezed,}) {
  return _then(_AnilistMedia(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,idMal: freezed == idMal ? _self.idMal : idMal // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as AnilistTitle,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,episodes: freezed == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as int?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String?,seasonYear: freezed == seasonYear ? _self.seasonYear : seasonYear // ignore: cast_nullable_to_non_nullable
as int?,averageScore: freezed == averageScore ? _self.averageScore : averageScore // ignore: cast_nullable_to_non_nullable
as int?,meanScore: freezed == meanScore ? _self.meanScore : meanScore // ignore: cast_nullable_to_non_nullable
as int?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int?,trending: freezed == trending ? _self.trending : trending // ignore: cast_nullable_to_non_nullable
as int?,favourites: freezed == favourites ? _self.favourites : favourites // ignore: cast_nullable_to_non_nullable
as int?,countryOfOrigin: freezed == countryOfOrigin ? _self.countryOfOrigin : countryOfOrigin // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,isLicensed: freezed == isLicensed ? _self.isLicensed : isLicensed // ignore: cast_nullable_to_non_nullable
as bool?,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>,synonyms: null == synonyms ? _self._synonyms : synonyms // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<AnilistTag>,rankings: null == rankings ? _self._rankings : rankings // ignore: cast_nullable_to_non_nullable
as List<AnilistRanking>,coverImage: null == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as AnilistCoverImage,bannerImage: freezed == bannerImage ? _self.bannerImage : bannerImage // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as AnilistFuzzyDate,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as AnilistFuzzyDate,studios: null == studios ? _self.studios : studios // ignore: cast_nullable_to_non_nullable
as AnilistStudios,siteUrl: freezed == siteUrl ? _self.siteUrl : siteUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AnilistMedia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnilistTitleCopyWith<$Res> get title {
  
  return $AnilistTitleCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of AnilistMedia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnilistCoverImageCopyWith<$Res> get coverImage {
  
  return $AnilistCoverImageCopyWith<$Res>(_self.coverImage, (value) {
    return _then(_self.copyWith(coverImage: value));
  });
}/// Create a copy of AnilistMedia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnilistFuzzyDateCopyWith<$Res> get startDate {
  
  return $AnilistFuzzyDateCopyWith<$Res>(_self.startDate, (value) {
    return _then(_self.copyWith(startDate: value));
  });
}/// Create a copy of AnilistMedia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnilistFuzzyDateCopyWith<$Res> get endDate {
  
  return $AnilistFuzzyDateCopyWith<$Res>(_self.endDate, (value) {
    return _then(_self.copyWith(endDate: value));
  });
}/// Create a copy of AnilistMedia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnilistStudiosCopyWith<$Res> get studios {
  
  return $AnilistStudiosCopyWith<$Res>(_self.studios, (value) {
    return _then(_self.copyWith(studios: value));
  });
}
}


/// @nodoc
mixin _$AnilistTitle {

 String? get romaji; String? get english;@JsonKey(name: 'native') String? get nativeTitle;
/// Create a copy of AnilistTitle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnilistTitleCopyWith<AnilistTitle> get copyWith => _$AnilistTitleCopyWithImpl<AnilistTitle>(this as AnilistTitle, _$identity);

  /// Serializes this AnilistTitle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnilistTitle&&(identical(other.romaji, romaji) || other.romaji == romaji)&&(identical(other.english, english) || other.english == english)&&(identical(other.nativeTitle, nativeTitle) || other.nativeTitle == nativeTitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,romaji,english,nativeTitle);

@override
String toString() {
  return 'AnilistTitle(romaji: $romaji, english: $english, nativeTitle: $nativeTitle)';
}


}

/// @nodoc
abstract mixin class $AnilistTitleCopyWith<$Res>  {
  factory $AnilistTitleCopyWith(AnilistTitle value, $Res Function(AnilistTitle) _then) = _$AnilistTitleCopyWithImpl;
@useResult
$Res call({
 String? romaji, String? english,@JsonKey(name: 'native') String? nativeTitle
});




}
/// @nodoc
class _$AnilistTitleCopyWithImpl<$Res>
    implements $AnilistTitleCopyWith<$Res> {
  _$AnilistTitleCopyWithImpl(this._self, this._then);

  final AnilistTitle _self;
  final $Res Function(AnilistTitle) _then;

/// Create a copy of AnilistTitle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? romaji = freezed,Object? english = freezed,Object? nativeTitle = freezed,}) {
  return _then(_self.copyWith(
romaji: freezed == romaji ? _self.romaji : romaji // ignore: cast_nullable_to_non_nullable
as String?,english: freezed == english ? _self.english : english // ignore: cast_nullable_to_non_nullable
as String?,nativeTitle: freezed == nativeTitle ? _self.nativeTitle : nativeTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnilistTitle].
extension AnilistTitlePatterns on AnilistTitle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnilistTitle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnilistTitle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnilistTitle value)  $default,){
final _that = this;
switch (_that) {
case _AnilistTitle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnilistTitle value)?  $default,){
final _that = this;
switch (_that) {
case _AnilistTitle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? romaji,  String? english, @JsonKey(name: 'native')  String? nativeTitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnilistTitle() when $default != null:
return $default(_that.romaji,_that.english,_that.nativeTitle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? romaji,  String? english, @JsonKey(name: 'native')  String? nativeTitle)  $default,) {final _that = this;
switch (_that) {
case _AnilistTitle():
return $default(_that.romaji,_that.english,_that.nativeTitle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? romaji,  String? english, @JsonKey(name: 'native')  String? nativeTitle)?  $default,) {final _that = this;
switch (_that) {
case _AnilistTitle() when $default != null:
return $default(_that.romaji,_that.english,_that.nativeTitle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnilistTitle implements AnilistTitle {
  const _AnilistTitle({required this.romaji, required this.english, @JsonKey(name: 'native') required this.nativeTitle});
  factory _AnilistTitle.fromJson(Map<String, dynamic> json) => _$AnilistTitleFromJson(json);

@override final  String? romaji;
@override final  String? english;
@override@JsonKey(name: 'native') final  String? nativeTitle;

/// Create a copy of AnilistTitle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnilistTitleCopyWith<_AnilistTitle> get copyWith => __$AnilistTitleCopyWithImpl<_AnilistTitle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnilistTitleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnilistTitle&&(identical(other.romaji, romaji) || other.romaji == romaji)&&(identical(other.english, english) || other.english == english)&&(identical(other.nativeTitle, nativeTitle) || other.nativeTitle == nativeTitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,romaji,english,nativeTitle);

@override
String toString() {
  return 'AnilistTitle(romaji: $romaji, english: $english, nativeTitle: $nativeTitle)';
}


}

/// @nodoc
abstract mixin class _$AnilistTitleCopyWith<$Res> implements $AnilistTitleCopyWith<$Res> {
  factory _$AnilistTitleCopyWith(_AnilistTitle value, $Res Function(_AnilistTitle) _then) = __$AnilistTitleCopyWithImpl;
@override @useResult
$Res call({
 String? romaji, String? english,@JsonKey(name: 'native') String? nativeTitle
});




}
/// @nodoc
class __$AnilistTitleCopyWithImpl<$Res>
    implements _$AnilistTitleCopyWith<$Res> {
  __$AnilistTitleCopyWithImpl(this._self, this._then);

  final _AnilistTitle _self;
  final $Res Function(_AnilistTitle) _then;

/// Create a copy of AnilistTitle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? romaji = freezed,Object? english = freezed,Object? nativeTitle = freezed,}) {
  return _then(_AnilistTitle(
romaji: freezed == romaji ? _self.romaji : romaji // ignore: cast_nullable_to_non_nullable
as String?,english: freezed == english ? _self.english : english // ignore: cast_nullable_to_non_nullable
as String?,nativeTitle: freezed == nativeTitle ? _self.nativeTitle : nativeTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AnilistTag {

 String get name; int? get rank; bool? get isMediaSpoiler; String? get category;
/// Create a copy of AnilistTag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnilistTagCopyWith<AnilistTag> get copyWith => _$AnilistTagCopyWithImpl<AnilistTag>(this as AnilistTag, _$identity);

  /// Serializes this AnilistTag to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnilistTag&&(identical(other.name, name) || other.name == name)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.isMediaSpoiler, isMediaSpoiler) || other.isMediaSpoiler == isMediaSpoiler)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,rank,isMediaSpoiler,category);

@override
String toString() {
  return 'AnilistTag(name: $name, rank: $rank, isMediaSpoiler: $isMediaSpoiler, category: $category)';
}


}

/// @nodoc
abstract mixin class $AnilistTagCopyWith<$Res>  {
  factory $AnilistTagCopyWith(AnilistTag value, $Res Function(AnilistTag) _then) = _$AnilistTagCopyWithImpl;
@useResult
$Res call({
 String name, int? rank, bool? isMediaSpoiler, String? category
});




}
/// @nodoc
class _$AnilistTagCopyWithImpl<$Res>
    implements $AnilistTagCopyWith<$Res> {
  _$AnilistTagCopyWithImpl(this._self, this._then);

  final AnilistTag _self;
  final $Res Function(AnilistTag) _then;

/// Create a copy of AnilistTag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? rank = freezed,Object? isMediaSpoiler = freezed,Object? category = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rank: freezed == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int?,isMediaSpoiler: freezed == isMediaSpoiler ? _self.isMediaSpoiler : isMediaSpoiler // ignore: cast_nullable_to_non_nullable
as bool?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnilistTag].
extension AnilistTagPatterns on AnilistTag {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnilistTag value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnilistTag() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnilistTag value)  $default,){
final _that = this;
switch (_that) {
case _AnilistTag():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnilistTag value)?  $default,){
final _that = this;
switch (_that) {
case _AnilistTag() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int? rank,  bool? isMediaSpoiler,  String? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnilistTag() when $default != null:
return $default(_that.name,_that.rank,_that.isMediaSpoiler,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int? rank,  bool? isMediaSpoiler,  String? category)  $default,) {final _that = this;
switch (_that) {
case _AnilistTag():
return $default(_that.name,_that.rank,_that.isMediaSpoiler,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int? rank,  bool? isMediaSpoiler,  String? category)?  $default,) {final _that = this;
switch (_that) {
case _AnilistTag() when $default != null:
return $default(_that.name,_that.rank,_that.isMediaSpoiler,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnilistTag implements AnilistTag {
  const _AnilistTag({required this.name, required this.rank, required this.isMediaSpoiler, required this.category});
  factory _AnilistTag.fromJson(Map<String, dynamic> json) => _$AnilistTagFromJson(json);

@override final  String name;
@override final  int? rank;
@override final  bool? isMediaSpoiler;
@override final  String? category;

/// Create a copy of AnilistTag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnilistTagCopyWith<_AnilistTag> get copyWith => __$AnilistTagCopyWithImpl<_AnilistTag>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnilistTagToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnilistTag&&(identical(other.name, name) || other.name == name)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.isMediaSpoiler, isMediaSpoiler) || other.isMediaSpoiler == isMediaSpoiler)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,rank,isMediaSpoiler,category);

@override
String toString() {
  return 'AnilistTag(name: $name, rank: $rank, isMediaSpoiler: $isMediaSpoiler, category: $category)';
}


}

/// @nodoc
abstract mixin class _$AnilistTagCopyWith<$Res> implements $AnilistTagCopyWith<$Res> {
  factory _$AnilistTagCopyWith(_AnilistTag value, $Res Function(_AnilistTag) _then) = __$AnilistTagCopyWithImpl;
@override @useResult
$Res call({
 String name, int? rank, bool? isMediaSpoiler, String? category
});




}
/// @nodoc
class __$AnilistTagCopyWithImpl<$Res>
    implements _$AnilistTagCopyWith<$Res> {
  __$AnilistTagCopyWithImpl(this._self, this._then);

  final _AnilistTag _self;
  final $Res Function(_AnilistTag) _then;

/// Create a copy of AnilistTag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? rank = freezed,Object? isMediaSpoiler = freezed,Object? category = freezed,}) {
  return _then(_AnilistTag(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rank: freezed == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int?,isMediaSpoiler: freezed == isMediaSpoiler ? _self.isMediaSpoiler : isMediaSpoiler // ignore: cast_nullable_to_non_nullable
as bool?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AnilistRanking {

 int get rank; String? get type; int? get year; String? get season; bool? get allTime; String? get context;
/// Create a copy of AnilistRanking
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnilistRankingCopyWith<AnilistRanking> get copyWith => _$AnilistRankingCopyWithImpl<AnilistRanking>(this as AnilistRanking, _$identity);

  /// Serializes this AnilistRanking to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnilistRanking&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.type, type) || other.type == type)&&(identical(other.year, year) || other.year == year)&&(identical(other.season, season) || other.season == season)&&(identical(other.allTime, allTime) || other.allTime == allTime)&&(identical(other.context, context) || other.context == context));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rank,type,year,season,allTime,context);

@override
String toString() {
  return 'AnilistRanking(rank: $rank, type: $type, year: $year, season: $season, allTime: $allTime, context: $context)';
}


}

/// @nodoc
abstract mixin class $AnilistRankingCopyWith<$Res>  {
  factory $AnilistRankingCopyWith(AnilistRanking value, $Res Function(AnilistRanking) _then) = _$AnilistRankingCopyWithImpl;
@useResult
$Res call({
 int rank, String? type, int? year, String? season, bool? allTime, String? context
});




}
/// @nodoc
class _$AnilistRankingCopyWithImpl<$Res>
    implements $AnilistRankingCopyWith<$Res> {
  _$AnilistRankingCopyWithImpl(this._self, this._then);

  final AnilistRanking _self;
  final $Res Function(AnilistRanking) _then;

/// Create a copy of AnilistRanking
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rank = null,Object? type = freezed,Object? year = freezed,Object? season = freezed,Object? allTime = freezed,Object? context = freezed,}) {
  return _then(_self.copyWith(
rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String?,allTime: freezed == allTime ? _self.allTime : allTime // ignore: cast_nullable_to_non_nullable
as bool?,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnilistRanking].
extension AnilistRankingPatterns on AnilistRanking {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnilistRanking value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnilistRanking() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnilistRanking value)  $default,){
final _that = this;
switch (_that) {
case _AnilistRanking():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnilistRanking value)?  $default,){
final _that = this;
switch (_that) {
case _AnilistRanking() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int rank,  String? type,  int? year,  String? season,  bool? allTime,  String? context)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnilistRanking() when $default != null:
return $default(_that.rank,_that.type,_that.year,_that.season,_that.allTime,_that.context);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int rank,  String? type,  int? year,  String? season,  bool? allTime,  String? context)  $default,) {final _that = this;
switch (_that) {
case _AnilistRanking():
return $default(_that.rank,_that.type,_that.year,_that.season,_that.allTime,_that.context);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int rank,  String? type,  int? year,  String? season,  bool? allTime,  String? context)?  $default,) {final _that = this;
switch (_that) {
case _AnilistRanking() when $default != null:
return $default(_that.rank,_that.type,_that.year,_that.season,_that.allTime,_that.context);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnilistRanking implements AnilistRanking {
  const _AnilistRanking({required this.rank, required this.type, required this.year, required this.season, required this.allTime, required this.context});
  factory _AnilistRanking.fromJson(Map<String, dynamic> json) => _$AnilistRankingFromJson(json);

@override final  int rank;
@override final  String? type;
@override final  int? year;
@override final  String? season;
@override final  bool? allTime;
@override final  String? context;

/// Create a copy of AnilistRanking
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnilistRankingCopyWith<_AnilistRanking> get copyWith => __$AnilistRankingCopyWithImpl<_AnilistRanking>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnilistRankingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnilistRanking&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.type, type) || other.type == type)&&(identical(other.year, year) || other.year == year)&&(identical(other.season, season) || other.season == season)&&(identical(other.allTime, allTime) || other.allTime == allTime)&&(identical(other.context, context) || other.context == context));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rank,type,year,season,allTime,context);

@override
String toString() {
  return 'AnilistRanking(rank: $rank, type: $type, year: $year, season: $season, allTime: $allTime, context: $context)';
}


}

/// @nodoc
abstract mixin class _$AnilistRankingCopyWith<$Res> implements $AnilistRankingCopyWith<$Res> {
  factory _$AnilistRankingCopyWith(_AnilistRanking value, $Res Function(_AnilistRanking) _then) = __$AnilistRankingCopyWithImpl;
@override @useResult
$Res call({
 int rank, String? type, int? year, String? season, bool? allTime, String? context
});




}
/// @nodoc
class __$AnilistRankingCopyWithImpl<$Res>
    implements _$AnilistRankingCopyWith<$Res> {
  __$AnilistRankingCopyWithImpl(this._self, this._then);

  final _AnilistRanking _self;
  final $Res Function(_AnilistRanking) _then;

/// Create a copy of AnilistRanking
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rank = null,Object? type = freezed,Object? year = freezed,Object? season = freezed,Object? allTime = freezed,Object? context = freezed,}) {
  return _then(_AnilistRanking(
rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,season: freezed == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String?,allTime: freezed == allTime ? _self.allTime : allTime // ignore: cast_nullable_to_non_nullable
as bool?,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AnilistCoverImage {

 String? get large; String? get extraLarge; String? get color;
/// Create a copy of AnilistCoverImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnilistCoverImageCopyWith<AnilistCoverImage> get copyWith => _$AnilistCoverImageCopyWithImpl<AnilistCoverImage>(this as AnilistCoverImage, _$identity);

  /// Serializes this AnilistCoverImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnilistCoverImage&&(identical(other.large, large) || other.large == large)&&(identical(other.extraLarge, extraLarge) || other.extraLarge == extraLarge)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,large,extraLarge,color);

@override
String toString() {
  return 'AnilistCoverImage(large: $large, extraLarge: $extraLarge, color: $color)';
}


}

/// @nodoc
abstract mixin class $AnilistCoverImageCopyWith<$Res>  {
  factory $AnilistCoverImageCopyWith(AnilistCoverImage value, $Res Function(AnilistCoverImage) _then) = _$AnilistCoverImageCopyWithImpl;
@useResult
$Res call({
 String? large, String? extraLarge, String? color
});




}
/// @nodoc
class _$AnilistCoverImageCopyWithImpl<$Res>
    implements $AnilistCoverImageCopyWith<$Res> {
  _$AnilistCoverImageCopyWithImpl(this._self, this._then);

  final AnilistCoverImage _self;
  final $Res Function(AnilistCoverImage) _then;

/// Create a copy of AnilistCoverImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? large = freezed,Object? extraLarge = freezed,Object? color = freezed,}) {
  return _then(_self.copyWith(
large: freezed == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String?,extraLarge: freezed == extraLarge ? _self.extraLarge : extraLarge // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnilistCoverImage].
extension AnilistCoverImagePatterns on AnilistCoverImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnilistCoverImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnilistCoverImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnilistCoverImage value)  $default,){
final _that = this;
switch (_that) {
case _AnilistCoverImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnilistCoverImage value)?  $default,){
final _that = this;
switch (_that) {
case _AnilistCoverImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? large,  String? extraLarge,  String? color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnilistCoverImage() when $default != null:
return $default(_that.large,_that.extraLarge,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? large,  String? extraLarge,  String? color)  $default,) {final _that = this;
switch (_that) {
case _AnilistCoverImage():
return $default(_that.large,_that.extraLarge,_that.color);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? large,  String? extraLarge,  String? color)?  $default,) {final _that = this;
switch (_that) {
case _AnilistCoverImage() when $default != null:
return $default(_that.large,_that.extraLarge,_that.color);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnilistCoverImage implements AnilistCoverImage {
  const _AnilistCoverImage({required this.large, required this.extraLarge, required this.color});
  factory _AnilistCoverImage.fromJson(Map<String, dynamic> json) => _$AnilistCoverImageFromJson(json);

@override final  String? large;
@override final  String? extraLarge;
@override final  String? color;

/// Create a copy of AnilistCoverImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnilistCoverImageCopyWith<_AnilistCoverImage> get copyWith => __$AnilistCoverImageCopyWithImpl<_AnilistCoverImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnilistCoverImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnilistCoverImage&&(identical(other.large, large) || other.large == large)&&(identical(other.extraLarge, extraLarge) || other.extraLarge == extraLarge)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,large,extraLarge,color);

@override
String toString() {
  return 'AnilistCoverImage(large: $large, extraLarge: $extraLarge, color: $color)';
}


}

/// @nodoc
abstract mixin class _$AnilistCoverImageCopyWith<$Res> implements $AnilistCoverImageCopyWith<$Res> {
  factory _$AnilistCoverImageCopyWith(_AnilistCoverImage value, $Res Function(_AnilistCoverImage) _then) = __$AnilistCoverImageCopyWithImpl;
@override @useResult
$Res call({
 String? large, String? extraLarge, String? color
});




}
/// @nodoc
class __$AnilistCoverImageCopyWithImpl<$Res>
    implements _$AnilistCoverImageCopyWith<$Res> {
  __$AnilistCoverImageCopyWithImpl(this._self, this._then);

  final _AnilistCoverImage _self;
  final $Res Function(_AnilistCoverImage) _then;

/// Create a copy of AnilistCoverImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? large = freezed,Object? extraLarge = freezed,Object? color = freezed,}) {
  return _then(_AnilistCoverImage(
large: freezed == large ? _self.large : large // ignore: cast_nullable_to_non_nullable
as String?,extraLarge: freezed == extraLarge ? _self.extraLarge : extraLarge // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AnilistFuzzyDate {

 int? get year; int? get month; int? get day;
/// Create a copy of AnilistFuzzyDate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnilistFuzzyDateCopyWith<AnilistFuzzyDate> get copyWith => _$AnilistFuzzyDateCopyWithImpl<AnilistFuzzyDate>(this as AnilistFuzzyDate, _$identity);

  /// Serializes this AnilistFuzzyDate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnilistFuzzyDate&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month)&&(identical(other.day, day) || other.day == day));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,year,month,day);

@override
String toString() {
  return 'AnilistFuzzyDate(year: $year, month: $month, day: $day)';
}


}

/// @nodoc
abstract mixin class $AnilistFuzzyDateCopyWith<$Res>  {
  factory $AnilistFuzzyDateCopyWith(AnilistFuzzyDate value, $Res Function(AnilistFuzzyDate) _then) = _$AnilistFuzzyDateCopyWithImpl;
@useResult
$Res call({
 int? year, int? month, int? day
});




}
/// @nodoc
class _$AnilistFuzzyDateCopyWithImpl<$Res>
    implements $AnilistFuzzyDateCopyWith<$Res> {
  _$AnilistFuzzyDateCopyWithImpl(this._self, this._then);

  final AnilistFuzzyDate _self;
  final $Res Function(AnilistFuzzyDate) _then;

/// Create a copy of AnilistFuzzyDate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? year = freezed,Object? month = freezed,Object? day = freezed,}) {
  return _then(_self.copyWith(
year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int?,day: freezed == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnilistFuzzyDate].
extension AnilistFuzzyDatePatterns on AnilistFuzzyDate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnilistFuzzyDate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnilistFuzzyDate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnilistFuzzyDate value)  $default,){
final _that = this;
switch (_that) {
case _AnilistFuzzyDate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnilistFuzzyDate value)?  $default,){
final _that = this;
switch (_that) {
case _AnilistFuzzyDate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? year,  int? month,  int? day)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnilistFuzzyDate() when $default != null:
return $default(_that.year,_that.month,_that.day);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? year,  int? month,  int? day)  $default,) {final _that = this;
switch (_that) {
case _AnilistFuzzyDate():
return $default(_that.year,_that.month,_that.day);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? year,  int? month,  int? day)?  $default,) {final _that = this;
switch (_that) {
case _AnilistFuzzyDate() when $default != null:
return $default(_that.year,_that.month,_that.day);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnilistFuzzyDate implements AnilistFuzzyDate {
  const _AnilistFuzzyDate({required this.year, required this.month, required this.day});
  factory _AnilistFuzzyDate.fromJson(Map<String, dynamic> json) => _$AnilistFuzzyDateFromJson(json);

@override final  int? year;
@override final  int? month;
@override final  int? day;

/// Create a copy of AnilistFuzzyDate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnilistFuzzyDateCopyWith<_AnilistFuzzyDate> get copyWith => __$AnilistFuzzyDateCopyWithImpl<_AnilistFuzzyDate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnilistFuzzyDateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnilistFuzzyDate&&(identical(other.year, year) || other.year == year)&&(identical(other.month, month) || other.month == month)&&(identical(other.day, day) || other.day == day));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,year,month,day);

@override
String toString() {
  return 'AnilistFuzzyDate(year: $year, month: $month, day: $day)';
}


}

/// @nodoc
abstract mixin class _$AnilistFuzzyDateCopyWith<$Res> implements $AnilistFuzzyDateCopyWith<$Res> {
  factory _$AnilistFuzzyDateCopyWith(_AnilistFuzzyDate value, $Res Function(_AnilistFuzzyDate) _then) = __$AnilistFuzzyDateCopyWithImpl;
@override @useResult
$Res call({
 int? year, int? month, int? day
});




}
/// @nodoc
class __$AnilistFuzzyDateCopyWithImpl<$Res>
    implements _$AnilistFuzzyDateCopyWith<$Res> {
  __$AnilistFuzzyDateCopyWithImpl(this._self, this._then);

  final _AnilistFuzzyDate _self;
  final $Res Function(_AnilistFuzzyDate) _then;

/// Create a copy of AnilistFuzzyDate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? year = freezed,Object? month = freezed,Object? day = freezed,}) {
  return _then(_AnilistFuzzyDate(
year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,month: freezed == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int?,day: freezed == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$AnilistStudios {

 List<AnilistStudioEdge> get edges;
/// Create a copy of AnilistStudios
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnilistStudiosCopyWith<AnilistStudios> get copyWith => _$AnilistStudiosCopyWithImpl<AnilistStudios>(this as AnilistStudios, _$identity);

  /// Serializes this AnilistStudios to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnilistStudios&&const DeepCollectionEquality().equals(other.edges, edges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(edges));

@override
String toString() {
  return 'AnilistStudios(edges: $edges)';
}


}

/// @nodoc
abstract mixin class $AnilistStudiosCopyWith<$Res>  {
  factory $AnilistStudiosCopyWith(AnilistStudios value, $Res Function(AnilistStudios) _then) = _$AnilistStudiosCopyWithImpl;
@useResult
$Res call({
 List<AnilistStudioEdge> edges
});




}
/// @nodoc
class _$AnilistStudiosCopyWithImpl<$Res>
    implements $AnilistStudiosCopyWith<$Res> {
  _$AnilistStudiosCopyWithImpl(this._self, this._then);

  final AnilistStudios _self;
  final $Res Function(AnilistStudios) _then;

/// Create a copy of AnilistStudios
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? edges = null,}) {
  return _then(_self.copyWith(
edges: null == edges ? _self.edges : edges // ignore: cast_nullable_to_non_nullable
as List<AnilistStudioEdge>,
  ));
}

}


/// Adds pattern-matching-related methods to [AnilistStudios].
extension AnilistStudiosPatterns on AnilistStudios {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnilistStudios value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnilistStudios() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnilistStudios value)  $default,){
final _that = this;
switch (_that) {
case _AnilistStudios():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnilistStudios value)?  $default,){
final _that = this;
switch (_that) {
case _AnilistStudios() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AnilistStudioEdge> edges)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnilistStudios() when $default != null:
return $default(_that.edges);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AnilistStudioEdge> edges)  $default,) {final _that = this;
switch (_that) {
case _AnilistStudios():
return $default(_that.edges);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AnilistStudioEdge> edges)?  $default,) {final _that = this;
switch (_that) {
case _AnilistStudios() when $default != null:
return $default(_that.edges);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnilistStudios implements AnilistStudios {
  const _AnilistStudios({required final  List<AnilistStudioEdge> edges}): _edges = edges;
  factory _AnilistStudios.fromJson(Map<String, dynamic> json) => _$AnilistStudiosFromJson(json);

 final  List<AnilistStudioEdge> _edges;
@override List<AnilistStudioEdge> get edges {
  if (_edges is EqualUnmodifiableListView) return _edges;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_edges);
}


/// Create a copy of AnilistStudios
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnilistStudiosCopyWith<_AnilistStudios> get copyWith => __$AnilistStudiosCopyWithImpl<_AnilistStudios>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnilistStudiosToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnilistStudios&&const DeepCollectionEquality().equals(other._edges, _edges));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_edges));

@override
String toString() {
  return 'AnilistStudios(edges: $edges)';
}


}

/// @nodoc
abstract mixin class _$AnilistStudiosCopyWith<$Res> implements $AnilistStudiosCopyWith<$Res> {
  factory _$AnilistStudiosCopyWith(_AnilistStudios value, $Res Function(_AnilistStudios) _then) = __$AnilistStudiosCopyWithImpl;
@override @useResult
$Res call({
 List<AnilistStudioEdge> edges
});




}
/// @nodoc
class __$AnilistStudiosCopyWithImpl<$Res>
    implements _$AnilistStudiosCopyWith<$Res> {
  __$AnilistStudiosCopyWithImpl(this._self, this._then);

  final _AnilistStudios _self;
  final $Res Function(_AnilistStudios) _then;

/// Create a copy of AnilistStudios
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? edges = null,}) {
  return _then(_AnilistStudios(
edges: null == edges ? _self._edges : edges // ignore: cast_nullable_to_non_nullable
as List<AnilistStudioEdge>,
  ));
}


}


/// @nodoc
mixin _$AnilistStudioEdge {

 bool? get isMain; AnilistStudioNode get node;
/// Create a copy of AnilistStudioEdge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnilistStudioEdgeCopyWith<AnilistStudioEdge> get copyWith => _$AnilistStudioEdgeCopyWithImpl<AnilistStudioEdge>(this as AnilistStudioEdge, _$identity);

  /// Serializes this AnilistStudioEdge to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnilistStudioEdge&&(identical(other.isMain, isMain) || other.isMain == isMain)&&(identical(other.node, node) || other.node == node));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isMain,node);

@override
String toString() {
  return 'AnilistStudioEdge(isMain: $isMain, node: $node)';
}


}

/// @nodoc
abstract mixin class $AnilistStudioEdgeCopyWith<$Res>  {
  factory $AnilistStudioEdgeCopyWith(AnilistStudioEdge value, $Res Function(AnilistStudioEdge) _then) = _$AnilistStudioEdgeCopyWithImpl;
@useResult
$Res call({
 bool? isMain, AnilistStudioNode node
});


$AnilistStudioNodeCopyWith<$Res> get node;

}
/// @nodoc
class _$AnilistStudioEdgeCopyWithImpl<$Res>
    implements $AnilistStudioEdgeCopyWith<$Res> {
  _$AnilistStudioEdgeCopyWithImpl(this._self, this._then);

  final AnilistStudioEdge _self;
  final $Res Function(AnilistStudioEdge) _then;

/// Create a copy of AnilistStudioEdge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isMain = freezed,Object? node = null,}) {
  return _then(_self.copyWith(
isMain: freezed == isMain ? _self.isMain : isMain // ignore: cast_nullable_to_non_nullable
as bool?,node: null == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as AnilistStudioNode,
  ));
}
/// Create a copy of AnilistStudioEdge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnilistStudioNodeCopyWith<$Res> get node {
  
  return $AnilistStudioNodeCopyWith<$Res>(_self.node, (value) {
    return _then(_self.copyWith(node: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnilistStudioEdge].
extension AnilistStudioEdgePatterns on AnilistStudioEdge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnilistStudioEdge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnilistStudioEdge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnilistStudioEdge value)  $default,){
final _that = this;
switch (_that) {
case _AnilistStudioEdge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnilistStudioEdge value)?  $default,){
final _that = this;
switch (_that) {
case _AnilistStudioEdge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? isMain,  AnilistStudioNode node)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnilistStudioEdge() when $default != null:
return $default(_that.isMain,_that.node);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? isMain,  AnilistStudioNode node)  $default,) {final _that = this;
switch (_that) {
case _AnilistStudioEdge():
return $default(_that.isMain,_that.node);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? isMain,  AnilistStudioNode node)?  $default,) {final _that = this;
switch (_that) {
case _AnilistStudioEdge() when $default != null:
return $default(_that.isMain,_that.node);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnilistStudioEdge implements AnilistStudioEdge {
  const _AnilistStudioEdge({required this.isMain, required this.node});
  factory _AnilistStudioEdge.fromJson(Map<String, dynamic> json) => _$AnilistStudioEdgeFromJson(json);

@override final  bool? isMain;
@override final  AnilistStudioNode node;

/// Create a copy of AnilistStudioEdge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnilistStudioEdgeCopyWith<_AnilistStudioEdge> get copyWith => __$AnilistStudioEdgeCopyWithImpl<_AnilistStudioEdge>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnilistStudioEdgeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnilistStudioEdge&&(identical(other.isMain, isMain) || other.isMain == isMain)&&(identical(other.node, node) || other.node == node));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isMain,node);

@override
String toString() {
  return 'AnilistStudioEdge(isMain: $isMain, node: $node)';
}


}

/// @nodoc
abstract mixin class _$AnilistStudioEdgeCopyWith<$Res> implements $AnilistStudioEdgeCopyWith<$Res> {
  factory _$AnilistStudioEdgeCopyWith(_AnilistStudioEdge value, $Res Function(_AnilistStudioEdge) _then) = __$AnilistStudioEdgeCopyWithImpl;
@override @useResult
$Res call({
 bool? isMain, AnilistStudioNode node
});


@override $AnilistStudioNodeCopyWith<$Res> get node;

}
/// @nodoc
class __$AnilistStudioEdgeCopyWithImpl<$Res>
    implements _$AnilistStudioEdgeCopyWith<$Res> {
  __$AnilistStudioEdgeCopyWithImpl(this._self, this._then);

  final _AnilistStudioEdge _self;
  final $Res Function(_AnilistStudioEdge) _then;

/// Create a copy of AnilistStudioEdge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isMain = freezed,Object? node = null,}) {
  return _then(_AnilistStudioEdge(
isMain: freezed == isMain ? _self.isMain : isMain // ignore: cast_nullable_to_non_nullable
as bool?,node: null == node ? _self.node : node // ignore: cast_nullable_to_non_nullable
as AnilistStudioNode,
  ));
}

/// Create a copy of AnilistStudioEdge
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnilistStudioNodeCopyWith<$Res> get node {
  
  return $AnilistStudioNodeCopyWith<$Res>(_self.node, (value) {
    return _then(_self.copyWith(node: value));
  });
}
}


/// @nodoc
mixin _$AnilistStudioNode {

 int get id; String get name;
/// Create a copy of AnilistStudioNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnilistStudioNodeCopyWith<AnilistStudioNode> get copyWith => _$AnilistStudioNodeCopyWithImpl<AnilistStudioNode>(this as AnilistStudioNode, _$identity);

  /// Serializes this AnilistStudioNode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnilistStudioNode&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'AnilistStudioNode(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $AnilistStudioNodeCopyWith<$Res>  {
  factory $AnilistStudioNodeCopyWith(AnilistStudioNode value, $Res Function(AnilistStudioNode) _then) = _$AnilistStudioNodeCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$AnilistStudioNodeCopyWithImpl<$Res>
    implements $AnilistStudioNodeCopyWith<$Res> {
  _$AnilistStudioNodeCopyWithImpl(this._self, this._then);

  final AnilistStudioNode _self;
  final $Res Function(AnilistStudioNode) _then;

/// Create a copy of AnilistStudioNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AnilistStudioNode].
extension AnilistStudioNodePatterns on AnilistStudioNode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnilistStudioNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnilistStudioNode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnilistStudioNode value)  $default,){
final _that = this;
switch (_that) {
case _AnilistStudioNode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnilistStudioNode value)?  $default,){
final _that = this;
switch (_that) {
case _AnilistStudioNode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnilistStudioNode() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _AnilistStudioNode():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _AnilistStudioNode() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnilistStudioNode implements AnilistStudioNode {
  const _AnilistStudioNode({required this.id, required this.name});
  factory _AnilistStudioNode.fromJson(Map<String, dynamic> json) => _$AnilistStudioNodeFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of AnilistStudioNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnilistStudioNodeCopyWith<_AnilistStudioNode> get copyWith => __$AnilistStudioNodeCopyWithImpl<_AnilistStudioNode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnilistStudioNodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnilistStudioNode&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'AnilistStudioNode(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$AnilistStudioNodeCopyWith<$Res> implements $AnilistStudioNodeCopyWith<$Res> {
  factory _$AnilistStudioNodeCopyWith(_AnilistStudioNode value, $Res Function(_AnilistStudioNode) _then) = __$AnilistStudioNodeCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$AnilistStudioNodeCopyWithImpl<$Res>
    implements _$AnilistStudioNodeCopyWith<$Res> {
  __$AnilistStudioNodeCopyWithImpl(this._self, this._then);

  final _AnilistStudioNode _self;
  final $Res Function(_AnilistStudioNode) _then;

/// Create a copy of AnilistStudioNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_AnilistStudioNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
