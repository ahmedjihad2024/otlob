import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otlob/core/network/base_response.dart';

part 'products_response.freezed.dart';
part 'products_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class ProductsResponse
    with _$ProductsResponse
    implements BasicResponse {
  const factory ProductsResponse({
    @Default(true) bool success,
    @Default('') String message,
    @Default(1) @JsonKey(name: 'pageIndex') int pageIndex,
    @Default(10) @JsonKey(name: 'pageSize') int pageSize,
    @Default(0) @JsonKey(name: 'count') int count,
    @Default([]) @JsonKey(name: 'data') List<ProductItemDto> data,
  }) = _ProductsResponse;

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
}

@freezed
abstract class ProductItemDto with _$ProductItemDto {
  const factory ProductItemDto({
    @JsonKey(name: 'id') dynamic id,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'pictureUrl') @Default('') String pictureUrl,
    @JsonKey(name: 'price') @Default(0.0) double price,
    @JsonKey(name: 'brandId') int? brandId,
    @JsonKey(name: 'brand') @Default('') String brand,
    @JsonKey(name: 'categoryId') int? categoryId,
    @JsonKey(name: 'category') @Default('') String category,
  }) = _ProductItemDto;

  factory ProductItemDto.fromJson(Map<String, dynamic> json) =>
      _$ProductItemDtoFromJson(json);
}

@freezed
abstract class BrandDto with _$BrandDto {
  const factory BrandDto({
    @JsonKey(name: 'id') dynamic id,
    @JsonKey(name: 'name') @Default('') String name,
  }) = _BrandDto;

  factory BrandDto.fromJson(Map<String, dynamic> json) =>
      _$BrandDtoFromJson(json);
}

@freezed
abstract class CategoryDto with _$CategoryDto {
  const factory CategoryDto({
    @JsonKey(name: 'id') dynamic id,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'pictureUrl') String? pictureUrl,
    @JsonKey(name: 'emoji') String? emoji,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
}
