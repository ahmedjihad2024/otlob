import 'package:otlob/shared/cart/data/api/cart_api_service.dart';
import 'package:otlob/shared/cart/data/request/update_basket_request.dart';
import 'package:otlob/shared/cart/data/responses/basket_response.dart';

abstract class CartRemoteDataSource {
  Future<BasketResponse> getBasket();
  Future<BasketResponse> updateBasket(UpdateBasketRequest request);
  Future<void> deleteBasket();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final CartApiService _apiService;

  CartRemoteDataSourceImpl(this._apiService);

  @override
  Future<BasketResponse> getBasket() => _apiService.getBasket();

  @override
  Future<BasketResponse> updateBasket(UpdateBasketRequest request) =>
      _apiService.updateBasket(request);

  @override
  Future<void> deleteBasket() => _apiService.deleteBasket();
}

