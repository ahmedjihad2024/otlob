import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_products_request.freezed.dart';
part 'get_products_request.g.dart';

@freezed
abstract class GetProductsRequest with _$GetProductsRequest {
  const GetProductsRequest._();

  const factory GetProductsRequest({
    @JsonKey(name: 'PageSize') int? pageSize,
    @JsonKey(name: 'PageIndex') int? pageIndex,
    @JsonKey(name: 'Search') String? search,
    @JsonKey(name: 'sort') String? sort,
    @JsonKey(name: 'brandId') int? brandId,
    @JsonKey(name: 'categoryId') int? categoryId,
  }) = _GetProductsRequest;

  factory GetProductsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetProductsRequestFromJson(json);

  /// Converts to query parameters, omitting null and empty values.
  Map<String, dynamic> toQueryParameters() {
    final map = toJson();
    map.removeWhere((_, v) => v == null || (v is String && v.isEmpty));
    return map;
  }
}
