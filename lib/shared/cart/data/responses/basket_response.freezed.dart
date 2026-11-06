// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BasketResponse {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'items') List<BasketItemDto> get items;
/// Create a copy of BasketResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasketResponseCopyWith<BasketResponse> get copyWith => _$BasketResponseCopyWithImpl<BasketResponse>(this as BasketResponse, _$identity);

  /// Serializes this BasketResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BasketResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasketResponse&&(identical(other.id, _this.id) || other.id == _this.id)&&const DeepCollectionEquality().equals(other.items, _this.items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BasketResponse;
  return Object.hash(runtimeType,_this.id,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as BasketResponse;
  return 'BasketResponse(id: ${_this.id}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $BasketResponseCopyWith<$Res>  {
  factory $BasketResponseCopyWith(BasketResponse value, $Res Function(BasketResponse) _then) = _$BasketResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'items') List<BasketItemDto> items
});




}
/// @nodoc
class _$BasketResponseCopyWithImpl<$Res>
    implements $BasketResponseCopyWith<$Res> {
  _$BasketResponseCopyWithImpl(this._self, this._then);

  final BasketResponse _self;
  final $Res Function(BasketResponse) _then;

/// Create a copy of BasketResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? items = null,}) {
  return _then(BasketResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<BasketItemDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [BasketResponse].
extension BasketResponsePatterns on BasketResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BasketResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BasketResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BasketResponse value)  $default,){
final _that = this;
switch (_that) {
case _BasketResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BasketResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BasketResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'items')  List<BasketItemDto> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BasketResponse() when $default != null:
return $default(_that.id,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'items')  List<BasketItemDto> items)  $default,) {final _that = this;
switch (_that) {
case _BasketResponse():
return $default(_that.id,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'items')  List<BasketItemDto> items)?  $default,) {final _that = this;
switch (_that) {
case _BasketResponse() when $default != null:
return $default(_that.id,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BasketResponse implements BasketResponse {
  const _BasketResponse({@JsonKey(name: 'id') this.id = '', @JsonKey(name: 'items') this.items = const []});
  factory _BasketResponse.fromJson(Map<String, dynamic> json) => _$BasketResponseFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'items') final  List<BasketItemDto> items;

/// Create a copy of BasketResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasketResponseCopyWith<_BasketResponse> get copyWith => __$BasketResponseCopyWithImpl<_BasketResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BasketResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasketResponse&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,const DeepCollectionEquality().hash(items));
}

@override
String toString() {
    return 'BasketResponse(id: $id, items: $items)';
}


}

/// @nodoc
abstract mixin class _$BasketResponseCopyWith<$Res> implements $BasketResponseCopyWith<$Res> {
  factory _$BasketResponseCopyWith(_BasketResponse value, $Res Function(_BasketResponse) _then) = __$BasketResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'items') List<BasketItemDto> items
});




}
/// @nodoc
class __$BasketResponseCopyWithImpl<$Res>
    implements _$BasketResponseCopyWith<$Res> {
  __$BasketResponseCopyWithImpl(this._self, this._then);

  final _BasketResponse _self;
  final $Res Function(_BasketResponse) _then;

/// Create a copy of BasketResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? items = null,}) {
  return _then(_BasketResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<BasketItemDto>,
  ));
}


}


/// @nodoc
mixin _$BasketItemDto {

@JsonKey(name: 'id') dynamic get id;@JsonKey(name: 'productName') String get productName;@JsonKey(name: 'price') double get price;@JsonKey(name: 'pictureUrl') String get pictureUrl;@JsonKey(name: 'category') String get category;@JsonKey(name: 'brand') String get brand;@JsonKey(name: 'quantity') int get quantity;
/// Create a copy of BasketItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasketItemDtoCopyWith<BasketItemDto> get copyWith => _$BasketItemDtoCopyWithImpl<BasketItemDto>(this as BasketItemDto, _$identity);

  /// Serializes this BasketItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BasketItemDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasketItemDto&&const DeepCollectionEquality().equals(other.id, _this.id)&&(identical(other.productName, _this.productName) || other.productName == _this.productName)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.pictureUrl, _this.pictureUrl) || other.pictureUrl == _this.pictureUrl)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BasketItemDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.id),_this.productName,_this.price,_this.pictureUrl,_this.category,_this.brand,_this.quantity);
}

@override
String toString() {
  final _this = this as BasketItemDto;
  return 'BasketItemDto(id: ${_this.id}, productName: ${_this.productName}, price: ${_this.price}, pictureUrl: ${_this.pictureUrl}, category: ${_this.category}, brand: ${_this.brand}, quantity: ${_this.quantity})';
}


}

/// @nodoc
abstract mixin class $BasketItemDtoCopyWith<$Res>  {
  factory $BasketItemDtoCopyWith(BasketItemDto value, $Res Function(BasketItemDto) _then) = _$BasketItemDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') dynamic id,@JsonKey(name: 'productName') String productName,@JsonKey(name: 'price') double price,@JsonKey(name: 'pictureUrl') String pictureUrl,@JsonKey(name: 'category') String category,@JsonKey(name: 'brand') String brand,@JsonKey(name: 'quantity') int quantity
});




}
/// @nodoc
class _$BasketItemDtoCopyWithImpl<$Res>
    implements $BasketItemDtoCopyWith<$Res> {
  _$BasketItemDtoCopyWithImpl(this._self, this._then);

  final BasketItemDto _self;
  final $Res Function(BasketItemDto) _then;

/// Create a copy of BasketItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? productName = null,Object? price = null,Object? pictureUrl = null,Object? category = null,Object? brand = null,Object? quantity = null,}) {
  return _then(BasketItemDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,pictureUrl: null == pictureUrl ? _self.pictureUrl : pictureUrl // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BasketItemDto].
extension BasketItemDtoPatterns on BasketItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BasketItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BasketItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BasketItemDto value)  $default,){
final _that = this;
switch (_that) {
case _BasketItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BasketItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _BasketItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  dynamic id, @JsonKey(name: 'productName')  String productName, @JsonKey(name: 'price')  double price, @JsonKey(name: 'pictureUrl')  String pictureUrl, @JsonKey(name: 'category')  String category, @JsonKey(name: 'brand')  String brand, @JsonKey(name: 'quantity')  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BasketItemDto() when $default != null:
return $default(_that.id,_that.productName,_that.price,_that.pictureUrl,_that.category,_that.brand,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  dynamic id, @JsonKey(name: 'productName')  String productName, @JsonKey(name: 'price')  double price, @JsonKey(name: 'pictureUrl')  String pictureUrl, @JsonKey(name: 'category')  String category, @JsonKey(name: 'brand')  String brand, @JsonKey(name: 'quantity')  int quantity)  $default,) {final _that = this;
switch (_that) {
case _BasketItemDto():
return $default(_that.id,_that.productName,_that.price,_that.pictureUrl,_that.category,_that.brand,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  dynamic id, @JsonKey(name: 'productName')  String productName, @JsonKey(name: 'price')  double price, @JsonKey(name: 'pictureUrl')  String pictureUrl, @JsonKey(name: 'category')  String category, @JsonKey(name: 'brand')  String brand, @JsonKey(name: 'quantity')  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _BasketItemDto() when $default != null:
return $default(_that.id,_that.productName,_that.price,_that.pictureUrl,_that.category,_that.brand,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BasketItemDto implements BasketItemDto {
  const _BasketItemDto({@JsonKey(name: 'id') this.id, @JsonKey(name: 'productName') this.productName = '', @JsonKey(name: 'price') this.price = 0.0, @JsonKey(name: 'pictureUrl') this.pictureUrl = '', @JsonKey(name: 'category') this.category = '', @JsonKey(name: 'brand') this.brand = '', @JsonKey(name: 'quantity') this.quantity = 1});
  factory _BasketItemDto.fromJson(Map<String, dynamic> json) => _$BasketItemDtoFromJson(json);

@override@JsonKey(name: 'id') final  dynamic id;
@override@JsonKey(name: 'productName') final  String productName;
@override@JsonKey(name: 'price') final  double price;
@override@JsonKey(name: 'pictureUrl') final  String pictureUrl;
@override@JsonKey(name: 'category') final  String category;
@override@JsonKey(name: 'brand') final  String brand;
@override@JsonKey(name: 'quantity') final  int quantity;

/// Create a copy of BasketItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BasketItemDtoCopyWith<_BasketItemDto> get copyWith => __$BasketItemDtoCopyWithImpl<_BasketItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BasketItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BasketItemDto&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.price, price) || other.price == price)&&(identical(other.pictureUrl, pictureUrl) || other.pictureUrl == pictureUrl)&&(identical(other.category, category) || other.category == category)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(id),productName,price,pictureUrl,category,brand,quantity);
}

@override
String toString() {
    return 'BasketItemDto(id: $id, productName: $productName, price: $price, pictureUrl: $pictureUrl, category: $category, brand: $brand, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$BasketItemDtoCopyWith<$Res> implements $BasketItemDtoCopyWith<$Res> {
  factory _$BasketItemDtoCopyWith(_BasketItemDto value, $Res Function(_BasketItemDto) _then) = __$BasketItemDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') dynamic id,@JsonKey(name: 'productName') String productName,@JsonKey(name: 'price') double price,@JsonKey(name: 'pictureUrl') String pictureUrl,@JsonKey(name: 'category') String category,@JsonKey(name: 'brand') String brand,@JsonKey(name: 'quantity') int quantity
});




}
/// @nodoc
class __$BasketItemDtoCopyWithImpl<$Res>
    implements _$BasketItemDtoCopyWith<$Res> {
  __$BasketItemDtoCopyWithImpl(this._self, this._then);

  final _BasketItemDto _self;
  final $Res Function(_BasketItemDto) _then;

/// Create a copy of BasketItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? productName = null,Object? price = null,Object? pictureUrl = null,Object? category = null,Object? brand = null,Object? quantity = null,}) {
  return _then(_BasketItemDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,pictureUrl: null == pictureUrl ? _self.pictureUrl : pictureUrl // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
