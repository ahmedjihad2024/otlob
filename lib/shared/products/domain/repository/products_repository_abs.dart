import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/shared/products/data/request/get_products_request.dart';
import 'package:otlob/shared/products/domain/model/models.dart';

abstract class ProductsRepositoryAbs {
  Future<Either<Failure, List<ProductItem>>> getProducts(
    GetProductsRequest request,
  );

  Future<Either<Failure, ProductItem>> getProductById(int id);

  Future<Either<Failure, List<BrandItem>>> getBrands();

  Future<Either<Failure, List<CategoryItem>>> getCategories();
}
