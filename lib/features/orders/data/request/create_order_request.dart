import 'package:otlob/features/orders/data/responses/order_response.dart';

class CreateOrderRequest {
  final int deliverMethodID;
  final ShippingAddressDto shippingAddress;

  const CreateOrderRequest({
    required this.deliverMethodID,
    required this.shippingAddress,
  });

  Map<String, dynamic> toJson() => {
        'deliverMethodID': deliverMethodID,
        'shippingAddress': shippingAddress.toJson(),
      };
}

