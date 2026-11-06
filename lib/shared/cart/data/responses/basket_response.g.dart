// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BasketResponse _$BasketResponseFromJson(Map<String, dynamic> json) =>
    _BasketResponse(
      id: json['id'] as String? ?? '',
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => BasketItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BasketResponseToJson(_BasketResponse instance) =>
    <String, dynamic>{'id': instance.id, 'items': instance.items};

_BasketItemDto _$BasketItemDtoFromJson(Map<String, dynamic> json) =>
    _BasketItemDto(
      id: json['id'],
      productName: json['productName'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      pictureUrl: json['pictureUrl'] as String? ?? '',
      category: json['category'] as String? ?? '',
      brand: json['brand'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$BasketItemDtoToJson(_BasketItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'price': instance.price,
      'pictureUrl': instance.pictureUrl,
      'category': instance.category,
      'brand': instance.brand,
      'quantity': instance.quantity,
    };
