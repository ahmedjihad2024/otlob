import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/usecase/base.dart';
import 'package:otlob/shared/products/domain/model/brand_item.dart';
import 'package:otlob/shared/products/domain/repository/products_repository_abs.dart';

class GetBrandsUseCase implements Base<NoParams, List<BrandItem>> {
  final ProductsRepositoryAbs _repository;

  const GetBrandsUseCase(this._repository);

  @override
  Future<Either<Failure, List<BrandItem>>> execute(NoParams input) async {
    return await _repository.getBrands();
  }
}
