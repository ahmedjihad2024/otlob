import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/network/failure_message.dart';
import 'package:otlob/core/usecase/base.dart';
import 'package:otlob/shared/products/domain/model/category_item.dart';
import 'package:otlob/shared/products/domain/repository/products_repository_abs.dart';

class GetCategoriesUseCase implements Base<NoParams, List<CategoryItem>> {
  final ProductsRepositoryAbs _repository;

  const GetCategoriesUseCase(this._repository);

  @override
  Future<Either<Failure, List<CategoryItem>>> execute(NoParams input) async {
    return await _repository.getCategories();
  }
}
