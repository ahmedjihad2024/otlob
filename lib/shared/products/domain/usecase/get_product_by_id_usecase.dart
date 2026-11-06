import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/network/failure_message.dart';
import 'package:otlob/core/usecase/base.dart';
import 'package:otlob/shared/products/domain/model/product_item.dart';
import 'package:otlob/shared/products/domain/repository/products_repository_abs.dart';

class GetProductByIdUseCase implements Base<int, ProductItem> {
  final ProductsRepositoryAbs _repository;

  const GetProductByIdUseCase(this._repository);

  @override
  Future<Either<Failure, ProductItem>> execute(int input) async {
    return await _repository.getProductById(input);
  }
}
