import 'package:dio/dio.dart';
import 'package:otlob/core/config/constants.dart';
import 'package:otlob/features/orders/data/request/create_order_request.dart';
import 'package:otlob/features/orders/data/responses/order_response.dart';

class OrdersApiService {
  final Dio _dio;

  OrdersApiService(this._dio);

  Future<List<OrderDto>> getOrders() async {
    final response = await _dio.get('${Constants.baseUrl}/api/Orders');
    final data = response.data;
    if (data is List) {
      return data
          .map((i) => OrderDto.fromJson(i as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  Future<OrderDto> getOrderById(int orderId) async {
    final response = await _dio.get('${Constants.baseUrl}/api/Orders/$orderId');
    return OrderDto.fromJson(response.data as Map<String, dynamic>);
  }

  Future<OrderDto> createOrder(CreateOrderRequest request) async {
    final response = await _dio.post(
      '${Constants.baseUrl}/api/Orders',
      data: request.toJson(),
    );
    return OrderDto.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<DeliveryMethodDto>> getDeliveryMethods() async {
    final response =
        await _dio.get('${Constants.baseUrl}/api/Orders/DeliverMethods');
    final data = response.data;
    if (data is List) {
      return data
          .map((i) => DeliveryMethodDto.fromJson(i as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}

