import 'package:dio/dio.dart';
import 'package:otlob/shared/cart/data/request/update_basket_request.dart';
import 'package:otlob/shared/cart/data/responses/basket_response.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_api_service.g.dart';

@RestApi()
abstract class CartApiService {
  factory CartApiService(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) =
      _CartApiService;

  @GET('/api/Basket')
  Future<BasketResponse> getBasket();

  @POST('/api/Basket')
  Future<BasketResponse> updateBasket(
    @Body() UpdateBasketRequest request,
  );

  @DELETE('/api/Basket')
  Future<void> deleteBasket();
}

