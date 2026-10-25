// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignUpResponse {

@JsonKey(name: 'displayName') String? get displayName;@JsonKey(name: 'email') String? get email;@JsonKey(name: 'token') String? get token;
/// Create a copy of SignUpResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpResponseCopyWith<SignUpResponse> get copyWith => _$SignUpResponseCopyWithImpl<SignUpResponse>(this as SignUpResponse, _$identity);

  /// Serializes this SignUpResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpResponse&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,displayName,email,token);

@override
String toString() {
  return 'SignUpResponse(displayName: $displayName, email: $email, token: $token)';
}


}

/// @nodoc
abstract mixin class $SignUpResponseCopyWith<$Res>  {
  factory $SignUpResponseCopyWith(SignUpResponse value, $Res Function(SignUpResponse) _then) = _$SignUpResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'displayName') String? displayName,@JsonKey(name: 'email') String? email,@JsonKey(name: 'token') String? token
});




}
/// @nodoc
class _$SignUpResponseCopyWithImpl<$Res>
    implements $SignUpResponseCopyWith<$Res> {
  _$SignUpResponseCopyWithImpl(this._self, this._then);

  final SignUpResponse _self;
  final $Res Function(SignUpResponse) _then;

/// Create a copy of SignUpResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? displayName = freezed,Object? email = freezed,Object? token = freezed,}) {
  return _then(_self.copyWith(
displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SignUpResponse].
extension SignUpResponsePatterns on SignUpResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpResponse value)  $default,){
final _that = this;
switch (_that) {
case _SignUpResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'displayName')  String? displayName, @JsonKey(name: 'email')  String? email, @JsonKey(name: 'token')  String? token)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpResponse() when $default != null:
return $default(_that.displayName,_that.email,_that.token);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'displayName')  String? displayName, @JsonKey(name: 'email')  String? email, @JsonKey(name: 'token')  String? token)  $default,) {final _that = this;
switch (_that) {
case _SignUpResponse():
return $default(_that.displayName,_that.email,_that.token);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'displayName')  String? displayName, @JsonKey(name: 'email')  String? email, @JsonKey(name: 'token')  String? token)?  $default,) {final _that = this;
switch (_that) {
case _SignUpResponse() when $default != null:
return $default(_that.displayName,_that.email,_that.token);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignUpResponse implements SignUpResponse {
  const _SignUpResponse({@JsonKey(name: 'displayName') this.displayName, @JsonKey(name: 'email') this.email, @JsonKey(name: 'token') this.token});
  factory _SignUpResponse.fromJson(Map<String, dynamic> json) => _$SignUpResponseFromJson(json);

@override@JsonKey(name: 'displayName') final  String? displayName;
@override@JsonKey(name: 'email') final  String? email;
@override@JsonKey(name: 'token') final  String? token;

/// Create a copy of SignUpResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpResponseCopyWith<_SignUpResponse> get copyWith => __$SignUpResponseCopyWithImpl<_SignUpResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignUpResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpResponse&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,displayName,email,token);

@override
String toString() {
  return 'SignUpResponse(displayName: $displayName, email: $email, token: $token)';
}


}

/// @nodoc
abstract mixin class _$SignUpResponseCopyWith<$Res> implements $SignUpResponseCopyWith<$Res> {
  factory _$SignUpResponseCopyWith(_SignUpResponse value, $Res Function(_SignUpResponse) _then) = __$SignUpResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'displayName') String? displayName,@JsonKey(name: 'email') String? email,@JsonKey(name: 'token') String? token
});




}
/// @nodoc
class __$SignUpResponseCopyWithImpl<$Res>
    implements _$SignUpResponseCopyWith<$Res> {
  __$SignUpResponseCopyWithImpl(this._self, this._then);

  final _SignUpResponse _self;
  final $Res Function(_SignUpResponse) _then;

/// Create a copy of SignUpResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? displayName = freezed,Object? email = freezed,Object? token = freezed,}) {
  return _then(_SignUpResponse(
displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
