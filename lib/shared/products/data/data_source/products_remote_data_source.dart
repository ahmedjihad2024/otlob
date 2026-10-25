import 'package:otlob/shared/products/data/api/products_api_service.dart';
import 'package:otlob/shared/products/data/request/get_products_request.dart';
import 'package:otlob/shared/products/data/responses/products_response.dart';

abstract class ProductsRemoteDataSource {
  Future<ProductsResponse> getProducts(GetProductsRequest request);
  Future<List<BrandDto>> getBrands();
  Future<List<CategoryDto>> getCategories();
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final ProductsApiService _apiService;

  ProductsRemoteDataSourceImpl(this._apiService);

  @override
  Future<ProductsResponse> getProducts(GetProductsRequest request) {
    return _apiService.getProducts(request.toQueryParameters());
  }

  @override
  Future<List<BrandDto>> getBrands() {
    return _apiService.getBrands();
  }

  @override
  Future<List<CategoryDto>> getCategories() {
    return _apiService.getCategories();
  }
}
