import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/usecase/base.dart';
import 'package:otlob/shared/products/data/request/get_products_request.dart';
import 'package:otlob/shared/products/domain/model/product_item.dart';
import 'package:otlob/shared/products/domain/repository/products_repository_abs.dart';

class GetProductsUseCase implements Base<GetProductsRequest, List<ProductItem>> {
  final ProductsRepositoryAbs _repository;

  const GetProductsUseCase(this._repository);

  @override
  Future<Either<Failure, List<ProductItem>>> execute(
    GetProductsRequest input,
  ) async {
    return await _repository.getProducts(input);
  }
}
