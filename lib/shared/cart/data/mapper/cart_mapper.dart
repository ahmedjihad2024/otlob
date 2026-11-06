import 'package:otlob/shared/cart/data/responses/basket_response.dart';
import 'package:otlob/shared/cart/domain/model/basket_model.dart';

extension BasketItemDtoMapper on BasketItemDto? {
  BasketItemModel toDomain() {
    final rawId = this?.id;
    final intId = rawId is int
        ? rawId
        : int.tryParse(rawId?.toString() ?? '0') ?? 0;

    return BasketItemModel(
      id: intId,
      productName: this?.productName ?? '',
      price: this?.price ?? 0.0,
      pictureUrl: this?.pictureUrl ?? '',
      category: this?.category ?? '',
      brand: this?.brand ?? '',
      quantity: this?.quantity ?? 1,
    );
  }
}

extension BasketResponseMapper on BasketResponse? {
  BasketModel toDomain() {
    final dtoList = this?.items;
    return BasketModel(
      id: this?.id ?? '',
      items: dtoList != null ? dtoList.map((dto) => dto.toDomain()).toList() : [],
    );
  }
}
