import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/features/orders/data/request/create_order_request.dart';
import 'package:otlob/features/orders/domain/model/order_model.dart';

abstract class OrdersRepositoryAbs {
  Future<Either<Failure, List<OrderModel>>> getOrders();
  Future<Either<Failure, OrderModel>> getOrderById(int orderId);
  Future<Either<Failure, OrderModel>> createOrder(CreateOrderRequest request);
  Future<Either<Failure, List<DeliveryMethodModel>>> getDeliveryMethods();
}

