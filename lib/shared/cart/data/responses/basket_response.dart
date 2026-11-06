import 'package:freezed_annotation/freezed_annotation.dart';

part 'basket_response.freezed.dart';
part 'basket_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class BasketResponse with _$BasketResponse {
  const factory BasketResponse({
    @JsonKey(name: 'id') @Default('') String id,
    @JsonKey(name: 'items') @Default([]) List<BasketItemDto> items,
  }) = _BasketResponse;

  factory BasketResponse.fromJson(Map<String, dynamic> json) =>
      _$BasketResponseFromJson(json);
}

@freezed
abstract class BasketItemDto with _$BasketItemDto {
  const factory BasketItemDto({
    @JsonKey(name: 'id') dynamic id,
    @JsonKey(name: 'productName') @Default('') String productName,
    @JsonKey(name: 'price') @Default(0.0) double price,
    @JsonKey(name: 'pictureUrl') @Default('') String pictureUrl,
    @JsonKey(name: 'category') @Default('') String category,
    @JsonKey(name: 'brand') @Default('') String brand,
    @JsonKey(name: 'quantity') @Default(1) int quantity,
  }) = _BasketItemDto;

  factory BasketItemDto.fromJson(Map<String, dynamic> json) =>
      _$BasketItemDtoFromJson(json);
}
