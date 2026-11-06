import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/usecase/base.dart';
import 'package:otlob/features/orders/domain/model/order_model.dart';
import 'package:otlob/features/orders/domain/repository/orders_repository_abs.dart';

class GetOrderByIdUseCase implements Base<int, OrderModel> {
  final OrdersRepositoryAbs _repository;

  const GetOrderByIdUseCase(this._repository);

  @override
  Future<Either<Failure, OrderModel>> execute(int input) {
    return _repository.getOrderById(input);
  }
}

