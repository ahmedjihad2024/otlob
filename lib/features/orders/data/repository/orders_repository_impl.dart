import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/error_handler.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/features/orders/data/data_source/orders_remote_data_source.dart';
import 'package:otlob/features/orders/data/mapper/orders_mapper.dart';
import 'package:otlob/features/orders/data/request/create_order_request.dart';
import 'package:otlob/features/orders/data/responses/order_response.dart';
import 'package:otlob/features/orders/domain/model/order_model.dart';
import 'package:otlob/features/orders/domain/repository/orders_repository_abs.dart';

class OrdersRepositoryImpl implements OrdersRepositoryAbs {
  final OrdersRemoteDataSource _remoteDataSource;

  OrdersRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders() {
    return fastHandler<List<OrderDto>, List<OrderModel>>(
      request: () => _remoteDataSource.getOrders(),
      mapper: (list) => list.map((dto) => dto.toDomain()).toList(),
    );
  }

  @override
  Future<Either<Failure, OrderModel>> getOrderById(int orderId) {
    return fastHandler<OrderDto, OrderModel>(
      request: () => _remoteDataSource.getOrderById(orderId),
      mapper: (dto) => dto.toDomain(),
    );
  }

  @override
  Future<Either<Failure, OrderModel>> createOrder(CreateOrderRequest request) {
    return fastHandler<OrderDto, OrderModel>(
      request: () => _remoteDataSource.createOrder(request),
      mapper: (dto) => dto.toDomain(),
    );
  }

  @override
  Future<Either<Failure, List<DeliveryMethodModel>>> getDeliveryMethods() {
    return fastHandler<List<DeliveryMethodDto>, List<DeliveryMethodModel>>(
      request: () => _remoteDataSource.getDeliveryMethods(),
      mapper: (list) => list.map((dto) => dto.toDomain()).toList(),
    );
  }
}

