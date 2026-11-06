// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_basket_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateBasketRequest {

@JsonKey(name: 'productId') int get productId;@JsonKey(name: 'quantity') int get quantity;
/// Create a copy of UpdateBasketRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateBasketRequestCopyWith<UpdateBasketRequest> get copyWith => _$UpdateBasketRequestCopyWithImpl<UpdateBasketRequest>(this as UpdateBasketRequest, _$identity);

  /// Serializes this UpdateBasketRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UpdateBasketRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateBasketRequest&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UpdateBasketRequest;
  return Object.hash(runtimeType,_this.productId,_this.quantity);
}

@override
String toString() {
  final _this = this as UpdateBasketRequest;
  return 'UpdateBasketRequest(productId: ${_this.productId}, quantity: ${_this.quantity})';
}


}

/// @nodoc
abstract mixin class $UpdateBasketRequestCopyWith<$Res>  {
  factory $UpdateBasketRequestCopyWith(UpdateBasketRequest value, $Res Function(UpdateBasketRequest) _then) = _$UpdateBasketRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'productId') int productId,@JsonKey(name: 'quantity') int quantity
});




}
/// @nodoc
class _$UpdateBasketRequestCopyWithImpl<$Res>
    implements $UpdateBasketRequestCopyWith<$Res> {
  _$UpdateBasketRequestCopyWithImpl(this._self, this._then);

  final UpdateBasketRequest _self;
  final $Res Function(UpdateBasketRequest) _then;

/// Create a copy of UpdateBasketRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? quantity = null,}) {
  return _then(UpdateBasketRequest(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateBasketRequest].
extension UpdateBasketRequestPatterns on UpdateBasketRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateBasketRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateBasketRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateBasketRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateBasketRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateBasketRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateBasketRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'productId')  int productId, @JsonKey(name: 'quantity')  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateBasketRequest() when $default != null:
return $default(_that.productId,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'productId')  int productId, @JsonKey(name: 'quantity')  int quantity)  $default,) {final _that = this;
switch (_that) {
case _UpdateBasketRequest():
return $default(_that.productId,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'productId')  int productId, @JsonKey(name: 'quantity')  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _UpdateBasketRequest() when $default != null:
return $default(_that.productId,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateBasketRequest implements UpdateBasketRequest {
  const _UpdateBasketRequest({@JsonKey(name: 'productId') required this.productId, @JsonKey(name: 'quantity') required this.quantity});
  factory _UpdateBasketRequest.fromJson(Map<String, dynamic> json) => _$UpdateBasketRequestFromJson(json);

@override@JsonKey(name: 'productId') final  int productId;
@override@JsonKey(name: 'quantity') final  int quantity;

/// Create a copy of UpdateBasketRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateBasketRequestCopyWith<_UpdateBasketRequest> get copyWith => __$UpdateBasketRequestCopyWithImpl<_UpdateBasketRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateBasketRequestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateBasketRequest&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,productId,quantity);
}

@override
String toString() {
    return 'UpdateBasketRequest(productId: $productId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$UpdateBasketRequestCopyWith<$Res> implements $UpdateBasketRequestCopyWith<$Res> {
  factory _$UpdateBasketRequestCopyWith(_UpdateBasketRequest value, $Res Function(_UpdateBasketRequest) _then) = __$UpdateBasketRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'productId') int productId,@JsonKey(name: 'quantity') int quantity
});




}
/// @nodoc
class __$UpdateBasketRequestCopyWithImpl<$Res>
    implements _$UpdateBasketRequestCopyWith<$Res> {
  __$UpdateBasketRequestCopyWithImpl(this._self, this._then);

  final _UpdateBasketRequest _self;
  final $Res Function(_UpdateBasketRequest) _then;

/// Create a copy of UpdateBasketRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? quantity = null,}) {
  return _then(_UpdateBasketRequest(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
