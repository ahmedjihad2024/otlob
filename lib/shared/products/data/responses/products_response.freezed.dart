// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductsResponse {

 bool get success; String get message;@JsonKey(name: 'pageIndex') int get pageIndex;@JsonKey(name: 'pageSize') int get pageSize;@JsonKey(name: 'count') int get count;@JsonKey(name: 'data') List<ProductItemDto> get data;
/// Create a copy of ProductsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsResponseCopyWith<ProductsResponse> get copyWith => _$ProductsResponseCopyWithImpl<ProductsResponse>(this as ProductsResponse, _$identity);

  /// Serializes this ProductsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProductsResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsResponse&&(identical(other.success, _this.success) || other.success == _this.success)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.pageIndex, _this.pageIndex) || other.pageIndex == _this.pageIndex)&&(identical(other.pageSize, _this.pageSize) || other.pageSize == _this.pageSize)&&(identical(other.count, _this.count) || other.count == _this.count)&&const DeepCollectionEquality().equals(other.data, _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProductsResponse;
  return Object.hash(runtimeType,_this.success,_this.message,_this.pageIndex,_this.pageSize,_this.count,const DeepCollectionEquality().hash(_this.data));
}

@override
String toString() {
  final _this = this as ProductsResponse;
  return 'ProductsResponse(success: ${_this.success}, message: ${_this.message}, pageIndex: ${_this.pageIndex}, pageSize: ${_this.pageSize}, count: ${_this.count}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $ProductsResponseCopyWith<$Res>  {
  factory $ProductsResponseCopyWith(ProductsResponse value, $Res Function(ProductsResponse) _then) = _$ProductsResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message,@JsonKey(name: 'pageIndex') int pageIndex,@JsonKey(name: 'pageSize') int pageSize,@JsonKey(name: 'count') int count,@JsonKey(name: 'data') List<ProductItemDto> data
});




}
/// @nodoc
class _$ProductsResponseCopyWithImpl<$Res>
    implements $ProductsResponseCopyWith<$Res> {
  _$ProductsResponseCopyWithImpl(this._self, this._then);

  final ProductsResponse _self;
  final $Res Function(ProductsResponse) _then;

/// Create a copy of ProductsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? pageIndex = null,Object? pageSize = null,Object? count = null,Object? data = null,}) {
  return _then(ProductsResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,pageIndex: null == pageIndex ? _self.pageIndex : pageIndex // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ProductItemDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductsResponse].
extension ProductsResponsePatterns on ProductsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductsResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProductsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProductsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message, @JsonKey(name: 'pageIndex')  int pageIndex, @JsonKey(name: 'pageSize')  int pageSize, @JsonKey(name: 'count')  int count, @JsonKey(name: 'data')  List<ProductItemDto> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductsResponse() when $default != null:
return $default(_that.success,_that.message,_that.pageIndex,_that.pageSize,_that.count,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message, @JsonKey(name: 'pageIndex')  int pageIndex, @JsonKey(name: 'pageSize')  int pageSize, @JsonKey(name: 'count')  int count, @JsonKey(name: 'data')  List<ProductItemDto> data)  $default,) {final _that = this;
switch (_that) {
case _ProductsResponse():
return $default(_that.success,_that.message,_that.pageIndex,_that.pageSize,_that.count,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message, @JsonKey(name: 'pageIndex')  int pageIndex, @JsonKey(name: 'pageSize')  int pageSize, @JsonKey(name: 'count')  int count, @JsonKey(name: 'data')  List<ProductItemDto> data)?  $default,) {final _that = this;
switch (_that) {
case _ProductsResponse() when $default != null:
return $default(_that.success,_that.message,_that.pageIndex,_that.pageSize,_that.count,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductsResponse implements ProductsResponse {
  const _ProductsResponse({this.success = true, this.message = '', @JsonKey(name: 'pageIndex') this.pageIndex = 1, @JsonKey(name: 'pageSize') this.pageSize = 10, @JsonKey(name: 'count') this.count = 0, @JsonKey(name: 'data') this.data = const []});
  factory _ProductsResponse.fromJson(Map<String, dynamic> json) => _$ProductsResponseFromJson(json);

@override@JsonKey() final  bool success;
@override@JsonKey() final  String message;
@override@JsonKey(name: 'pageIndex') final  int pageIndex;
@override@JsonKey(name: 'pageSize') final  int pageSize;
@override@JsonKey(name: 'count') final  int count;
@override@JsonKey(name: 'data') final  List<ProductItemDto> data;

/// Create a copy of ProductsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductsResponseCopyWith<_ProductsResponse> get copyWith => __$ProductsResponseCopyWithImpl<_ProductsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.pageIndex, pageIndex) || other.pageIndex == pageIndex)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,success,message,pageIndex,pageSize,count,const DeepCollectionEquality().hash(data));
}

@override
String toString() {
    return 'ProductsResponse(success: $success, message: $message, pageIndex: $pageIndex, pageSize: $pageSize, count: $count, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ProductsResponseCopyWith<$Res> implements $ProductsResponseCopyWith<$Res> {
  factory _$ProductsResponseCopyWith(_ProductsResponse value, $Res Function(_ProductsResponse) _then) = __$ProductsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message,@JsonKey(name: 'pageIndex') int pageIndex,@JsonKey(name: 'pageSize') int pageSize,@JsonKey(name: 'count') int count,@JsonKey(name: 'data') List<ProductItemDto> data
});




}
/// @nodoc
class __$ProductsResponseCopyWithImpl<$Res>
    implements _$ProductsResponseCopyWith<$Res> {
  __$ProductsResponseCopyWithImpl(this._self, this._then);

  final _ProductsResponse _self;
  final $Res Function(_ProductsResponse) _then;

/// Create a copy of ProductsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? pageIndex = null,Object? pageSize = null,Object? count = null,Object? data = null,}) {
  return _then(_ProductsResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,pageIndex: null == pageIndex ? _self.pageIndex : pageIndex // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ProductItemDto>,
  ));
}


}


/// @nodoc
mixin _$ProductItemDto {

@JsonKey(name: 'id') dynamic get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'description') String? get description;@JsonKey(name: 'pictureUrl') String get pictureUrl;@JsonKey(name: 'price') double get price;@JsonKey(name: 'brandId') int? get brandId;@JsonKey(name: 'brand') String get brand;@JsonKey(name: 'categoryId') int? get categoryId;@JsonKey(name: 'category') String get category;
/// Create a copy of ProductItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductItemDtoCopyWith<ProductItemDto> get copyWith => _$ProductItemDtoCopyWithImpl<ProductItemDto>(this as ProductItemDto, _$identity);

  /// Serializes this ProductItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProductItemDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductItemDto&&const DeepCollectionEquality().equals(other.id, _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.pictureUrl, _this.pictureUrl) || other.pictureUrl == _this.pictureUrl)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.brandId, _this.brandId) || other.brandId == _this.brandId)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.category, _this.category) || other.category == _this.category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProductItemDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.id),_this.name,_this.description,_this.pictureUrl,_this.price,_this.brandId,_this.brand,_this.categoryId,_this.category);
}

@override
String toString() {
  final _this = this as ProductItemDto;
  return 'ProductItemDto(id: ${_this.id}, name: ${_this.name}, description: ${_this.description}, pictureUrl: ${_this.pictureUrl}, price: ${_this.price}, brandId: ${_this.brandId}, brand: ${_this.brand}, categoryId: ${_this.categoryId}, category: ${_this.category})';
}


}

/// @nodoc
abstract mixin class $ProductItemDtoCopyWith<$Res>  {
  factory $ProductItemDtoCopyWith(ProductItemDto value, $Res Function(ProductItemDto) _then) = _$ProductItemDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') dynamic id,@JsonKey(name: 'name') String name,@JsonKey(name: 'description') String? description,@JsonKey(name: 'pictureUrl') String pictureUrl,@JsonKey(name: 'price') double price,@JsonKey(name: 'brandId') int? brandId,@JsonKey(name: 'brand') String brand,@JsonKey(name: 'categoryId') int? categoryId,@JsonKey(name: 'category') String category
});




}
/// @nodoc
class _$ProductItemDtoCopyWithImpl<$Res>
    implements $ProductItemDtoCopyWith<$Res> {
  _$ProductItemDtoCopyWithImpl(this._self, this._then);

  final ProductItemDto _self;
  final $Res Function(ProductItemDto) _then;

/// Create a copy of ProductItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? description = freezed,Object? pictureUrl = null,Object? price = null,Object? brandId = freezed,Object? brand = null,Object? categoryId = freezed,Object? category = null,}) {
  return _then(ProductItemDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,pictureUrl: null == pictureUrl ? _self.pictureUrl : pictureUrl // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductItemDto].
extension ProductItemDtoPatterns on ProductItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductItemDto value)  $default,){
final _that = this;
switch (_that) {
case _ProductItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProductItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  dynamic id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'pictureUrl')  String pictureUrl, @JsonKey(name: 'price')  double price, @JsonKey(name: 'brandId')  int? brandId, @JsonKey(name: 'brand')  String brand, @JsonKey(name: 'categoryId')  int? categoryId, @JsonKey(name: 'category')  String category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductItemDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.pictureUrl,_that.price,_that.brandId,_that.brand,_that.categoryId,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  dynamic id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'pictureUrl')  String pictureUrl, @JsonKey(name: 'price')  double price, @JsonKey(name: 'brandId')  int? brandId, @JsonKey(name: 'brand')  String brand, @JsonKey(name: 'categoryId')  int? categoryId, @JsonKey(name: 'category')  String category)  $default,) {final _that = this;
switch (_that) {
case _ProductItemDto():
return $default(_that.id,_that.name,_that.description,_that.pictureUrl,_that.price,_that.brandId,_that.brand,_that.categoryId,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  dynamic id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'description')  String? description, @JsonKey(name: 'pictureUrl')  String pictureUrl, @JsonKey(name: 'price')  double price, @JsonKey(name: 'brandId')  int? brandId, @JsonKey(name: 'brand')  String brand, @JsonKey(name: 'categoryId')  int? categoryId, @JsonKey(name: 'category')  String category)?  $default,) {final _that = this;
switch (_that) {
case _ProductItemDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.pictureUrl,_that.price,_that.brandId,_that.brand,_that.categoryId,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductItemDto implements ProductItemDto {
  const _ProductItemDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name = '', @JsonKey(name: 'description') this.description, @JsonKey(name: 'pictureUrl') this.pictureUrl = '', @JsonKey(name: 'price') this.price = 0.0, @JsonKey(name: 'brandId') this.brandId, @JsonKey(name: 'brand') this.brand = '', @JsonKey(name: 'categoryId') this.categoryId, @JsonKey(name: 'category') this.category = ''});
  factory _ProductItemDto.fromJson(Map<String, dynamic> json) => _$ProductItemDtoFromJson(json);

@override@JsonKey(name: 'id') final  dynamic id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'description') final  String? description;
@override@JsonKey(name: 'pictureUrl') final  String pictureUrl;
@override@JsonKey(name: 'price') final  double price;
@override@JsonKey(name: 'brandId') final  int? brandId;
@override@JsonKey(name: 'brand') final  String brand;
@override@JsonKey(name: 'categoryId') final  int? categoryId;
@override@JsonKey(name: 'category') final  String category;

/// Create a copy of ProductItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductItemDtoCopyWith<_ProductItemDto> get copyWith => __$ProductItemDtoCopyWithImpl<_ProductItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductItemDto&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.pictureUrl, pictureUrl) || other.pictureUrl == pictureUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(id),name,description,pictureUrl,price,brandId,brand,categoryId,category);
}

@override
String toString() {
    return 'ProductItemDto(id: $id, name: $name, description: $description, pictureUrl: $pictureUrl, price: $price, brandId: $brandId, brand: $brand, categoryId: $categoryId, category: $category)';
}


}

/// @nodoc
abstract mixin class _$ProductItemDtoCopyWith<$Res> implements $ProductItemDtoCopyWith<$Res> {
  factory _$ProductItemDtoCopyWith(_ProductItemDto value, $Res Function(_ProductItemDto) _then) = __$ProductItemDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') dynamic id,@JsonKey(name: 'name') String name,@JsonKey(name: 'description') String? description,@JsonKey(name: 'pictureUrl') String pictureUrl,@JsonKey(name: 'price') double price,@JsonKey(name: 'brandId') int? brandId,@JsonKey(name: 'brand') String brand,@JsonKey(name: 'categoryId') int? categoryId,@JsonKey(name: 'category') String category
});




}
/// @nodoc
class __$ProductItemDtoCopyWithImpl<$Res>
    implements _$ProductItemDtoCopyWith<$Res> {
  __$ProductItemDtoCopyWithImpl(this._self, this._then);

  final _ProductItemDto _self;
  final $Res Function(_ProductItemDto) _then;

/// Create a copy of ProductItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? description = freezed,Object? pictureUrl = null,Object? price = null,Object? brandId = freezed,Object? brand = null,Object? categoryId = freezed,Object? category = null,}) {
  return _then(_ProductItemDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,pictureUrl: null == pictureUrl ? _self.pictureUrl : pictureUrl // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BrandDto {

@JsonKey(name: 'id') dynamic get id;@JsonKey(name: 'name') String get name;
/// Create a copy of BrandDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandDtoCopyWith<BrandDto> get copyWith => _$BrandDtoCopyWithImpl<BrandDto>(this as BrandDto, _$identity);

  /// Serializes this BrandDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BrandDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandDto&&const DeepCollectionEquality().equals(other.id, _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BrandDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.id),_this.name);
}

@override
String toString() {
  final _this = this as BrandDto;
  return 'BrandDto(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $BrandDtoCopyWith<$Res>  {
  factory $BrandDtoCopyWith(BrandDto value, $Res Function(BrandDto) _then) = _$BrandDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') dynamic id,@JsonKey(name: 'name') String name
});




}
/// @nodoc
class _$BrandDtoCopyWithImpl<$Res>
    implements $BrandDtoCopyWith<$Res> {
  _$BrandDtoCopyWithImpl(this._self, this._then);

  final BrandDto _self;
  final $Res Function(BrandDto) _then;

/// Create a copy of BrandDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,}) {
  return _then(BrandDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BrandDto].
extension BrandDtoPatterns on BrandDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BrandDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrandDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BrandDto value)  $default,){
final _that = this;
switch (_that) {
case _BrandDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BrandDto value)?  $default,){
final _that = this;
switch (_that) {
case _BrandDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  dynamic id, @JsonKey(name: 'name')  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrandDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  dynamic id, @JsonKey(name: 'name')  String name)  $default,) {final _that = this;
switch (_that) {
case _BrandDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  dynamic id, @JsonKey(name: 'name')  String name)?  $default,) {final _that = this;
switch (_that) {
case _BrandDto() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BrandDto implements BrandDto {
  const _BrandDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name = ''});
  factory _BrandDto.fromJson(Map<String, dynamic> json) => _$BrandDtoFromJson(json);

@override@JsonKey(name: 'id') final  dynamic id;
@override@JsonKey(name: 'name') final  String name;

/// Create a copy of BrandDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrandDtoCopyWith<_BrandDto> get copyWith => __$BrandDtoCopyWithImpl<_BrandDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrandDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrandDto&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(id),name);
}

@override
String toString() {
    return 'BrandDto(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$BrandDtoCopyWith<$Res> implements $BrandDtoCopyWith<$Res> {
  factory _$BrandDtoCopyWith(_BrandDto value, $Res Function(_BrandDto) _then) = __$BrandDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') dynamic id,@JsonKey(name: 'name') String name
});




}
/// @nodoc
class __$BrandDtoCopyWithImpl<$Res>
    implements _$BrandDtoCopyWith<$Res> {
  __$BrandDtoCopyWithImpl(this._self, this._then);

  final _BrandDto _self;
  final $Res Function(_BrandDto) _then;

/// Create a copy of BrandDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,}) {
  return _then(_BrandDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CategoryDto {

@JsonKey(name: 'id') dynamic get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'pictureUrl') String? get pictureUrl;@JsonKey(name: 'emoji') String? get emoji;
/// Create a copy of CategoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryDtoCopyWith<CategoryDto> get copyWith => _$CategoryDtoCopyWithImpl<CategoryDto>(this as CategoryDto, _$identity);

  /// Serializes this CategoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CategoryDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryDto&&const DeepCollectionEquality().equals(other.id, _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.pictureUrl, _this.pictureUrl) || other.pictureUrl == _this.pictureUrl)&&(identical(other.emoji, _this.emoji) || other.emoji == _this.emoji));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CategoryDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.id),_this.name,_this.pictureUrl,_this.emoji);
}

@override
String toString() {
  final _this = this as CategoryDto;
  return 'CategoryDto(id: ${_this.id}, name: ${_this.name}, pictureUrl: ${_this.pictureUrl}, emoji: ${_this.emoji})';
}


}

/// @nodoc
abstract mixin class $CategoryDtoCopyWith<$Res>  {
  factory $CategoryDtoCopyWith(CategoryDto value, $Res Function(CategoryDto) _then) = _$CategoryDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') dynamic id,@JsonKey(name: 'name') String name,@JsonKey(name: 'pictureUrl') String? pictureUrl,@JsonKey(name: 'emoji') String? emoji
});




}
/// @nodoc
class _$CategoryDtoCopyWithImpl<$Res>
    implements $CategoryDtoCopyWith<$Res> {
  _$CategoryDtoCopyWithImpl(this._self, this._then);

  final CategoryDto _self;
  final $Res Function(CategoryDto) _then;

/// Create a copy of CategoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? pictureUrl = freezed,Object? emoji = freezed,}) {
  return _then(CategoryDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pictureUrl: freezed == pictureUrl ? _self.pictureUrl : pictureUrl // ignore: cast_nullable_to_non_nullable
as String?,emoji: freezed == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryDto].
extension CategoryDtoPatterns on CategoryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryDto value)  $default,){
final _that = this;
switch (_that) {
case _CategoryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  dynamic id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'pictureUrl')  String? pictureUrl, @JsonKey(name: 'emoji')  String? emoji)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryDto() when $default != null:
return $default(_that.id,_that.name,_that.pictureUrl,_that.emoji);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  dynamic id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'pictureUrl')  String? pictureUrl, @JsonKey(name: 'emoji')  String? emoji)  $default,) {final _that = this;
switch (_that) {
case _CategoryDto():
return $default(_that.id,_that.name,_that.pictureUrl,_that.emoji);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  dynamic id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'pictureUrl')  String? pictureUrl, @JsonKey(name: 'emoji')  String? emoji)?  $default,) {final _that = this;
switch (_that) {
case _CategoryDto() when $default != null:
return $default(_that.id,_that.name,_that.pictureUrl,_that.emoji);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryDto implements CategoryDto {
  const _CategoryDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name = '', @JsonKey(name: 'pictureUrl') this.pictureUrl, @JsonKey(name: 'emoji') this.emoji});
  factory _CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);

@override@JsonKey(name: 'id') final  dynamic id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'pictureUrl') final  String? pictureUrl;
@override@JsonKey(name: 'emoji') final  String? emoji;

/// Create a copy of CategoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryDtoCopyWith<_CategoryDto> get copyWith => __$CategoryDtoCopyWithImpl<_CategoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryDto&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.name, name) || other.name == name)&&(identical(other.pictureUrl, pictureUrl) || other.pictureUrl == pictureUrl)&&(identical(other.emoji, emoji) || other.emoji == emoji));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(id),name,pictureUrl,emoji);
}

@override
String toString() {
    return 'CategoryDto(id: $id, name: $name, pictureUrl: $pictureUrl, emoji: $emoji)';
}


}

/// @nodoc
abstract mixin class _$CategoryDtoCopyWith<$Res> implements $CategoryDtoCopyWith<$Res> {
  factory _$CategoryDtoCopyWith(_CategoryDto value, $Res Function(_CategoryDto) _then) = __$CategoryDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') dynamic id,@JsonKey(name: 'name') String name,@JsonKey(name: 'pictureUrl') String? pictureUrl,@JsonKey(name: 'emoji') String? emoji
});




}
/// @nodoc
class __$CategoryDtoCopyWithImpl<$Res>
    implements _$CategoryDtoCopyWith<$Res> {
  __$CategoryDtoCopyWithImpl(this._self, this._then);

  final _CategoryDto _self;
  final $Res Function(_CategoryDto) _then;

/// Create a copy of CategoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? pictureUrl = freezed,Object? emoji = freezed,}) {
  return _then(_CategoryDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,pictureUrl: freezed == pictureUrl ? _self.pictureUrl : pictureUrl // ignore: cast_nullable_to_non_nullable
as String?,emoji: freezed == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
