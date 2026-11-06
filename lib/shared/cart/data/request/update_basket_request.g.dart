// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_basket_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateBasketRequest _$UpdateBasketRequestFromJson(Map<String, dynamic> json) =>
    _UpdateBasketRequest(
      productId: (json['productId'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$UpdateBasketRequestToJson(
  _UpdateBasketRequest instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'quantity': instance.quantity,
};
