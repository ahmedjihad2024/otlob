import 'package:dio/dio.dart';
import 'package:otlob/shared/products/data/responses/products_response.dart';
import 'package:retrofit/retrofit.dart';

part 'products_api_service.g.dart';

@RestApi()
abstract class ProductsApiService {
  factory ProductsApiService(Dio dio, {String? baseUrl}) = _ProductsApiService;

  /// GET /api/Products
  /// Optional query params: PageSize, PageIndex, Search, sort, brandId, categoryId
  @GET('/api/Products')
  Future<ProductsResponse> getProducts(
    @Queries() Map<String, dynamic> queryParams,
  );

  /// GET /api/Products/brands
  @GET('/api/Products/brands')
  Future<List<BrandDto>> getBrands();

  /// GET /api/Products/categories
  @GET('/api/Products/categories')
  Future<List<CategoryDto>> getCategories();
}
