// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_products_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetProductsRequest {

@JsonKey(name: 'PageSize') int? get pageSize;@JsonKey(name: 'PageIndex') int? get pageIndex;@JsonKey(name: 'Search') String? get search;@JsonKey(name: 'sort') String? get sort;@JsonKey(name: 'brandId') int? get brandId;@JsonKey(name: 'categoryId') int? get categoryId;
/// Create a copy of GetProductsRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProductsRequestCopyWith<GetProductsRequest> get copyWith => _$GetProductsRequestCopyWithImpl<GetProductsRequest>(this as GetProductsRequest, _$identity);

  /// Serializes this GetProductsRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductsRequest&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.pageIndex, pageIndex) || other.pageIndex == pageIndex)&&(identical(other.search, search) || other.search == search)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pageSize,pageIndex,search,sort,brandId,categoryId);

@override
String toString() {
  return 'GetProductsRequest(pageSize: $pageSize, pageIndex: $pageIndex, search: $search, sort: $sort, brandId: $brandId, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $GetProductsRequestCopyWith<$Res>  {
  factory $GetProductsRequestCopyWith(GetProductsRequest value, $Res Function(GetProductsRequest) _then) = _$GetProductsRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'PageSize') int? pageSize,@JsonKey(name: 'PageIndex') int? pageIndex,@JsonKey(name: 'Search') String? search,@JsonKey(name: 'sort') String? sort,@JsonKey(name: 'brandId') int? brandId,@JsonKey(name: 'categoryId') int? categoryId
});




}
/// @nodoc
class _$GetProductsRequestCopyWithImpl<$Res>
    implements $GetProductsRequestCopyWith<$Res> {
  _$GetProductsRequestCopyWithImpl(this._self, this._then);

  final GetProductsRequest _self;
  final $Res Function(GetProductsRequest) _then;

/// Create a copy of GetProductsRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageSize = freezed,Object? pageIndex = freezed,Object? search = freezed,Object? sort = freezed,Object? brandId = freezed,Object? categoryId = freezed,}) {
  return _then(_self.copyWith(
pageSize: freezed == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int?,pageIndex: freezed == pageIndex ? _self.pageIndex : pageIndex // ignore: cast_nullable_to_non_nullable
as int?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetProductsRequest].
extension GetProductsRequestPatterns on GetProductsRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetProductsRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetProductsRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetProductsRequest value)  $default,){
final _that = this;
switch (_that) {
case _GetProductsRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetProductsRequest value)?  $default,){
final _that = this;
switch (_that) {
case _GetProductsRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'PageSize')  int? pageSize, @JsonKey(name: 'PageIndex')  int? pageIndex, @JsonKey(name: 'Search')  String? search, @JsonKey(name: 'sort')  String? sort, @JsonKey(name: 'brandId')  int? brandId, @JsonKey(name: 'categoryId')  int? categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetProductsRequest() when $default != null:
return $default(_that.pageSize,_that.pageIndex,_that.search,_that.sort,_that.brandId,_that.categoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'PageSize')  int? pageSize, @JsonKey(name: 'PageIndex')  int? pageIndex, @JsonKey(name: 'Search')  String? search, @JsonKey(name: 'sort')  String? sort, @JsonKey(name: 'brandId')  int? brandId, @JsonKey(name: 'categoryId')  int? categoryId)  $default,) {final _that = this;
switch (_that) {
case _GetProductsRequest():
return $default(_that.pageSize,_that.pageIndex,_that.search,_that.sort,_that.brandId,_that.categoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'PageSize')  int? pageSize, @JsonKey(name: 'PageIndex')  int? pageIndex, @JsonKey(name: 'Search')  String? search, @JsonKey(name: 'sort')  String? sort, @JsonKey(name: 'brandId')  int? brandId, @JsonKey(name: 'categoryId')  int? categoryId)?  $default,) {final _that = this;
switch (_that) {
case _GetProductsRequest() when $default != null:
return $default(_that.pageSize,_that.pageIndex,_that.search,_that.sort,_that.brandId,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetProductsRequest extends GetProductsRequest {
  const _GetProductsRequest({@JsonKey(name: 'PageSize') this.pageSize, @JsonKey(name: 'PageIndex') this.pageIndex, @JsonKey(name: 'Search') this.search, @JsonKey(name: 'sort') this.sort, @JsonKey(name: 'brandId') this.brandId, @JsonKey(name: 'categoryId') this.categoryId}): super._();
  factory _GetProductsRequest.fromJson(Map<String, dynamic> json) => _$GetProductsRequestFromJson(json);

@override@JsonKey(name: 'PageSize') final  int? pageSize;
@override@JsonKey(name: 'PageIndex') final  int? pageIndex;
@override@JsonKey(name: 'Search') final  String? search;
@override@JsonKey(name: 'sort') final  String? sort;
@override@JsonKey(name: 'brandId') final  int? brandId;
@override@JsonKey(name: 'categoryId') final  int? categoryId;

/// Create a copy of GetProductsRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetProductsRequestCopyWith<_GetProductsRequest> get copyWith => __$GetProductsRequestCopyWithImpl<_GetProductsRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetProductsRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetProductsRequest&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.pageIndex, pageIndex) || other.pageIndex == pageIndex)&&(identical(other.search, search) || other.search == search)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pageSize,pageIndex,search,sort,brandId,categoryId);

@override
String toString() {
  return 'GetProductsRequest(pageSize: $pageSize, pageIndex: $pageIndex, search: $search, sort: $sort, brandId: $brandId, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$GetProductsRequestCopyWith<$Res> implements $GetProductsRequestCopyWith<$Res> {
  factory _$GetProductsRequestCopyWith(_GetProductsRequest value, $Res Function(_GetProductsRequest) _then) = __$GetProductsRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'PageSize') int? pageSize,@JsonKey(name: 'PageIndex') int? pageIndex,@JsonKey(name: 'Search') String? search,@JsonKey(name: 'sort') String? sort,@JsonKey(name: 'brandId') int? brandId,@JsonKey(name: 'categoryId') int? categoryId
});




}
/// @nodoc
class __$GetProductsRequestCopyWithImpl<$Res>
    implements _$GetProductsRequestCopyWith<$Res> {
  __$GetProductsRequestCopyWithImpl(this._self, this._then);

  final _GetProductsRequest _self;
  final $Res Function(_GetProductsRequest) _then;

/// Create a copy of GetProductsRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageSize = freezed,Object? pageIndex = freezed,Object? search = freezed,Object? sort = freezed,Object? brandId = freezed,Object? categoryId = freezed,}) {
  return _then(_GetProductsRequest(
pageSize: freezed == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int?,pageIndex: freezed == pageIndex ? _self.pageIndex : pageIndex // ignore: cast_nullable_to_non_nullable
as int?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
