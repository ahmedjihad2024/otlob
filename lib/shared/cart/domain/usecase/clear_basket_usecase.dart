import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/usecase/base.dart';
import 'package:otlob/shared/cart/domain/repository/cart_repository_abs.dart';

class ClearBasketUseCase implements Base<NoParams, Unit> {
  final CartRepositoryAbs _repository;

  const ClearBasketUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> execute(NoParams input) {
    return _repository.deleteBasket();
  }
}

