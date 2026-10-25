import 'package:otlob/shared/products/data/responses/products_response.dart';
import 'package:otlob/shared/products/domain/model/brand_item.dart';
import 'package:otlob/shared/products/domain/model/category_item.dart';
import 'package:otlob/shared/products/domain/model/product_item.dart';

extension ProductItemDtoMapper on ProductItemDto? {
  ProductItem toDomain() {
    return ProductItem(
      id: this?.id?.toString() ?? '',
      name: this?.name ?? '',
      description: this?.description,
      pictureUrl: this?.pictureUrl ?? '',
      price: this?.price ?? 0.0,
      brandId: this?.brandId,
      brand: this?.brand ?? '',
      categoryId: this?.categoryId,
      category: this?.category ?? '',
    );
  }
}

extension ProductsResponseMapper on ProductsResponse? {
  List<ProductItem> toDomain() {
    return this?.data.map((dto) => dto.toDomain()).toList() ?? [];
  }
}

extension BrandDtoMapper on BrandDto? {
  BrandItem toDomain() {
    final rawId = this?.id;
    final intId = rawId is int
        ? rawId
        : int.tryParse(rawId?.toString() ?? '0') ?? 0;
    return BrandItem(id: intId, name: this?.name ?? '');
  }
}

extension BrandListMapper on List<BrandDto>? {
  List<BrandItem> toDomain() {
    return this?.map((dto) => dto.toDomain()).toList() ?? [];
  }
}

extension CategoryDtoMapper on CategoryDto? {
  CategoryItem toDomain() {
    return CategoryItem(
      id: this?.id?.toString() ?? '',
      name: this?.name ?? '',
      pictureUrl: this?.pictureUrl,
      emoji: this?.emoji,
    );
  }
}

extension CategoryListMapper on List<CategoryDto>? {
  List<CategoryItem> toDomain() {
    return this?.map((dto) => dto.toDomain()).toList() ?? [];
  }
}
