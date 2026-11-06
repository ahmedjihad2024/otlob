import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/network/failure_message.dart';
import 'package:otlob/core/usecase/base.dart';
import 'package:otlob/shared/cart/domain/model/basket_model.dart';
import 'package:otlob/shared/cart/domain/repository/cart_repository_abs.dart';

class GetBasketUseCase implements Base<NoParams, BasketModel> {
  final CartRepositoryAbs _repository;

  GetBasketUseCase(this._repository);

  @override
  Future<Either<Failure, BasketModel>> execute(NoParams params) {
    return _repository.getBasket();
  }
}
