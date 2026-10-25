import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/error_handler.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/shared/products/data/data_source/products_remote_data_source.dart';
import 'package:otlob/shared/products/data/mapper/products_mapper.dart';
import 'package:otlob/shared/products/data/request/get_products_request.dart';
import 'package:otlob/shared/products/data/responses/responses.dart';
import 'package:otlob/shared/products/domain/model/brand_item.dart';
import 'package:otlob/shared/products/domain/model/category_item.dart';
import 'package:otlob/shared/products/domain/model/product_item.dart';
import 'package:otlob/shared/products/domain/repository/products_repository_abs.dart';

class ProductsRepositoryImpl implements ProductsRepositoryAbs {
  final ProductsRemoteDataSource _remoteDataSource;

  ProductsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<ProductItem>>> getProducts(
    GetProductsRequest request,
  ) {
    return fastHandler<ProductsResponse, List<ProductItem>>(
      request: () => _remoteDataSource.getProducts(request),
      mapper: (response) => response.toDomain(),
    );
  }

  @override
  Future<Either<Failure, List<BrandItem>>> getBrands() {
    return fastHandler<List<BrandDto>, List<BrandItem>>(
      request: () => _remoteDataSource.getBrands(),
      mapper: (response) => response.toDomain(),
    );
  }

  @override
  Future<Either<Failure, List<CategoryItem>>> getCategories() {
    return fastHandler<List<CategoryDto>, List<CategoryItem>>(
      request: () => _remoteDataSource.getCategories(),
      mapper: (response) => response.toDomain(),
    );
  }
}
