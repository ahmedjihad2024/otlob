import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_basket_request.freezed.dart';
part 'update_basket_request.g.dart';

@freezed
abstract class UpdateBasketRequest with _$UpdateBasketRequest {
  const factory UpdateBasketRequest({
    @JsonKey(name: 'productId') required int productId,
    @JsonKey(name: 'quantity') required int quantity,
  }) = _UpdateBasketRequest;

  factory UpdateBasketRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateBasketRequestFromJson(json);
}
