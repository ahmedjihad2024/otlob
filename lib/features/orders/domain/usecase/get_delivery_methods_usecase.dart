import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/usecase/base.dart';
import 'package:otlob/features/orders/domain/model/order_model.dart';
import 'package:otlob/features/orders/domain/repository/orders_repository_abs.dart';

class GetDeliveryMethodsUseCase
    implements Base<NoParams, List<DeliveryMethodModel>> {
  final OrdersRepositoryAbs _repository;

  const GetDeliveryMethodsUseCase(this._repository);

  @override
  Future<Either<Failure, List<DeliveryMethodModel>>> execute(NoParams input) {
    return _repository.getDeliveryMethods();
  }
}

