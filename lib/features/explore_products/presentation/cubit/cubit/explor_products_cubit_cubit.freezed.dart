// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explor_products_cubit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExplorProductsCubitState {

 ExploreProductsStatus get status; List<ProductItem> get products; int get currentPage; bool get hasMore; bool get isLoadingMore; int get selectedSortIndex; String get searchQuery; String? get errorMessage;
/// Create a copy of ExplorProductsCubitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExplorProductsCubitStateCopyWith<ExplorProductsCubitState> get copyWith => _$ExplorProductsCubitStateCopyWithImpl<ExplorProductsCubitState>(this as ExplorProductsCubitState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ExplorProductsCubitState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExplorProductsCubitState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.products, _this.products)&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&(identical(other.hasMore, _this.hasMore) || other.hasMore == _this.hasMore)&&(identical(other.isLoadingMore, _this.isLoadingMore) || other.isLoadingMore == _this.isLoadingMore)&&(identical(other.selectedSortIndex, _this.selectedSortIndex) || other.selectedSortIndex == _this.selectedSortIndex)&&(identical(other.searchQuery, _this.searchQuery) || other.searchQuery == _this.searchQuery)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage));
}


@override
int get hashCode {
  final _this = this as ExplorProductsCubitState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.products),_this.currentPage,_this.hasMore,_this.isLoadingMore,_this.selectedSortIndex,_this.searchQuery,_this.errorMessage);
}

@override
String toString() {
  final _this = this as ExplorProductsCubitState;
  return 'ExplorProductsCubitState(status: ${_this.status}, products: ${_this.products}, currentPage: ${_this.currentPage}, hasMore: ${_this.hasMore}, isLoadingMore: ${_this.isLoadingMore}, selectedSortIndex: ${_this.selectedSortIndex}, searchQuery: ${_this.searchQuery}, errorMessage: ${_this.errorMessage})';
}


}

/// @nodoc
abstract mixin class $ExplorProductsCubitStateCopyWith<$Res>  {
  factory $ExplorProductsCubitStateCopyWith(ExplorProductsCubitState value, $Res Function(ExplorProductsCubitState) _then) = _$ExplorProductsCubitStateCopyWithImpl;
@useResult
$Res call({
 ExploreProductsStatus status, List<ProductItem> products, int currentPage, bool hasMore, bool isLoadingMore, int selectedSortIndex, String searchQuery, String? errorMessage
});




}
/// @nodoc
class _$ExplorProductsCubitStateCopyWithImpl<$Res>
    implements $ExplorProductsCubitStateCopyWith<$Res> {
  _$ExplorProductsCubitStateCopyWithImpl(this._self, this._then);

  final ExplorProductsCubitState _self;
  final $Res Function(ExplorProductsCubitState) _then;

/// Create a copy of ExplorProductsCubitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? products = null,Object? currentPage = null,Object? hasMore = null,Object? isLoadingMore = null,Object? selectedSortIndex = null,Object? searchQuery = null,Object? errorMessage = freezed,}) {
  return _then(ExplorProductsCubitState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ExploreProductsStatus,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductItem>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,selectedSortIndex: null == selectedSortIndex ? _self.selectedSortIndex : selectedSortIndex // ignore: cast_nullable_to_non_nullable
as int,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExplorProductsCubitState].
extension ExplorProductsCubitStatePatterns on ExplorProductsCubitState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExplorProductsCubitState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExplorProductsCubitState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExplorProductsCubitState value)  $default,){
final _that = this;
switch (_that) {
case _ExplorProductsCubitState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExplorProductsCubitState value)?  $default,){
final _that = this;
switch (_that) {
case _ExplorProductsCubitState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ExploreProductsStatus status,  List<ProductItem> products,  int currentPage,  bool hasMore,  bool isLoadingMore,  int selectedSortIndex,  String searchQuery,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExplorProductsCubitState() when $default != null:
return $default(_that.status,_that.products,_that.currentPage,_that.hasMore,_that.isLoadingMore,_that.selectedSortIndex,_that.searchQuery,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ExploreProductsStatus status,  List<ProductItem> products,  int currentPage,  bool hasMore,  bool isLoadingMore,  int selectedSortIndex,  String searchQuery,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ExplorProductsCubitState():
return $default(_that.status,_that.products,_that.currentPage,_that.hasMore,_that.isLoadingMore,_that.selectedSortIndex,_that.searchQuery,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ExploreProductsStatus status,  List<ProductItem> products,  int currentPage,  bool hasMore,  bool isLoadingMore,  int selectedSortIndex,  String searchQuery,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ExplorProductsCubitState() when $default != null:
return $default(_that.status,_that.products,_that.currentPage,_that.hasMore,_that.isLoadingMore,_that.selectedSortIndex,_that.searchQuery,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ExplorProductsCubitState implements ExplorProductsCubitState {
  const _ExplorProductsCubitState({this.status = ExploreProductsStatus.initial,  List<ProductItem> products = const [], this.currentPage = 0, this.hasMore = true, this.isLoadingMore = false, this.selectedSortIndex = 0, this.searchQuery = '', this.errorMessage}): _products = products;
  

@override@JsonKey() final  ExploreProductsStatus status;
 final  List<ProductItem> _products;
@override@JsonKey() List<ProductItem> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  int selectedSortIndex;
@override@JsonKey() final  String searchQuery;
@override final  String? errorMessage;

/// Create a copy of ExplorProductsCubitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExplorProductsCubitStateCopyWith<_ExplorProductsCubitState> get copyWith => __$ExplorProductsCubitStateCopyWithImpl<_ExplorProductsCubitState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExplorProductsCubitState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.products, _products)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.selectedSortIndex, selectedSortIndex) || other.selectedSortIndex == selectedSortIndex)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_products),currentPage,hasMore,isLoadingMore,selectedSortIndex,searchQuery,errorMessage);
}

@override
String toString() {
    return 'ExplorProductsCubitState(status: $status, products: $products, currentPage: $currentPage, hasMore: $hasMore, isLoadingMore: $isLoadingMore, selectedSortIndex: $selectedSortIndex, searchQuery: $searchQuery, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ExplorProductsCubitStateCopyWith<$Res> implements $ExplorProductsCubitStateCopyWith<$Res> {
  factory _$ExplorProductsCubitStateCopyWith(_ExplorProductsCubitState value, $Res Function(_ExplorProductsCubitState) _then) = __$ExplorProductsCubitStateCopyWithImpl;
@override @useResult
$Res call({
 ExploreProductsStatus status, List<ProductItem> products, int currentPage, bool hasMore, bool isLoadingMore, int selectedSortIndex, String searchQuery, String? errorMessage
});




}
/// @nodoc
class __$ExplorProductsCubitStateCopyWithImpl<$Res>
    implements _$ExplorProductsCubitStateCopyWith<$Res> {
  __$ExplorProductsCubitStateCopyWithImpl(this._self, this._then);

  final _ExplorProductsCubitState _self;
  final $Res Function(_ExplorProductsCubitState) _then;

/// Create a copy of ExplorProductsCubitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? products = null,Object? currentPage = null,Object? hasMore = null,Object? isLoadingMore = null,Object? selectedSortIndex = null,Object? searchQuery = null,Object? errorMessage = freezed,}) {
  return _then(_ExplorProductsCubitState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ExploreProductsStatus,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductItem>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,selectedSortIndex: null == selectedSortIndex ? _self.selectedSortIndex : selectedSortIndex // ignore: cast_nullable_to_non_nullable
as int,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
