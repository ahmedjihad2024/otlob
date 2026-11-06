import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/usecase/base.dart';
import 'package:otlob/features/orders/data/request/create_order_request.dart';
import 'package:otlob/features/orders/domain/model/order_model.dart';
import 'package:otlob/features/orders/domain/repository/orders_repository_abs.dart';

class CreateOrderUseCase implements Base<CreateOrderRequest, OrderModel> {
  final OrdersRepositoryAbs _repository;

  const CreateOrderUseCase(this._repository);

  @override
  Future<Either<Failure, OrderModel>> execute(CreateOrderRequest input) {
    return _repository.createOrder(input);
  }
}

