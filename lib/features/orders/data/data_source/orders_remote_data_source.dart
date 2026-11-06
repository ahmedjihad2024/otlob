import 'package:otlob/features/orders/data/api/orders_api_service.dart';
import 'package:otlob/features/orders/data/request/create_order_request.dart';
import 'package:otlob/features/orders/data/responses/order_response.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderDto>> getOrders();
  Future<OrderDto> getOrderById(int orderId);
  Future<OrderDto> createOrder(CreateOrderRequest request);
  Future<List<DeliveryMethodDto>> getDeliveryMethods();
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final OrdersApiService _apiService;

  OrdersRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<OrderDto>> getOrders() => _apiService.getOrders();

  @override
  Future<OrderDto> getOrderById(int orderId) => _apiService.getOrderById(orderId);

  @override
  Future<OrderDto> createOrder(CreateOrderRequest request) =>
      _apiService.createOrder(request);

  @override
  Future<List<DeliveryMethodDto>> getDeliveryMethods() =>
      _apiService.getDeliveryMethods();
}

