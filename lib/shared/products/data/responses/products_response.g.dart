// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    _ProductsResponse(
      success: json['success'] as bool? ?? true,
      message: json['message'] as String? ?? '',
      pageIndex: (json['pageIndex'] as num?)?.toInt() ?? 1,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 10,
      count: (json['count'] as num?)?.toInt() ?? 0,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => ProductItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ProductsResponseToJson(_ProductsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'pageIndex': instance.pageIndex,
      'pageSize': instance.pageSize,
      'count': instance.count,
      'data': instance.data,
    };

_ProductItemDto _$ProductItemDtoFromJson(Map<String, dynamic> json) =>
    _ProductItemDto(
      id: json['id'],
      name: json['name'] as String? ?? '',
      description: json['description'] as String?,
      pictureUrl: json['pictureUrl'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      brandId: (json['brandId'] as num?)?.toInt(),
      brand: json['brand'] as String? ?? '',
      categoryId: (json['categoryId'] as num?)?.toInt(),
      category: json['category'] as String? ?? '',
    );

Map<String, dynamic> _$ProductItemDtoToJson(_ProductItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'pictureUrl': instance.pictureUrl,
      'price': instance.price,
      'brandId': instance.brandId,
      'brand': instance.brand,
      'categoryId': instance.categoryId,
      'category': instance.category,
    };

_BrandDto _$BrandDtoFromJson(Map<String, dynamic> json) =>
    _BrandDto(id: json['id'], name: json['name'] as String? ?? '');

Map<String, dynamic> _$BrandDtoToJson(_BrandDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

_CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => _CategoryDto(
  id: json['id'],
  name: json['name'] as String? ?? '',
  pictureUrl: json['pictureUrl'] as String?,
  emoji: json['emoji'] as String?,
);

Map<String, dynamic> _$CategoryDtoToJson(_CategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pictureUrl': instance.pictureUrl,
      'emoji': instance.emoji,
    };
