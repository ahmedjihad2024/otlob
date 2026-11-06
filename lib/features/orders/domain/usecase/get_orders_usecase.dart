import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/usecase/base.dart';
import 'package:otlob/features/orders/domain/model/order_model.dart';
import 'package:otlob/features/orders/domain/repository/orders_repository_abs.dart';

class GetOrdersUseCase implements Base<NoParams, List<OrderModel>> {
  final OrdersRepositoryAbs _repository;

  const GetOrdersUseCase(this._repository);

  @override
  Future<Either<Failure, List<OrderModel>>> execute(NoParams input) {
    return _repository.getOrders();
  }
}

