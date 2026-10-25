// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetProductsRequest _$GetProductsRequestFromJson(Map<String, dynamic> json) =>
    _GetProductsRequest(
      pageSize: (json['PageSize'] as num?)?.toInt(),
      pageIndex: (json['PageIndex'] as num?)?.toInt(),
      search: json['Search'] as String?,
      sort: json['sort'] as String?,
      brandId: (json['brandId'] as num?)?.toInt(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetProductsRequestToJson(_GetProductsRequest instance) =>
    <String, dynamic>{
      'PageSize': instance.pageSize,
      'PageIndex': instance.pageIndex,
      'Search': instance.search,
      'sort': instance.sort,
      'brandId': instance.brandId,
      'categoryId': instance.categoryId,
    };
