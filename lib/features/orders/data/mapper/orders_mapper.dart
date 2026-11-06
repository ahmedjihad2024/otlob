import 'package:intl/intl.dart';
import 'package:otlob/features/orders/data/responses/order_response.dart';
import 'package:otlob/features/orders/domain/model/order_model.dart';

extension ShippingAddressDtoMapper on ShippingAddressDto? {
  ShippingAddressModel toDomain() {
    return ShippingAddressModel(
      firstName: this?.firstName ?? '',
      lastName: this?.lastName ?? '',
      street: this?.street ?? '',
      city: this?.city ?? '',
      country: this?.country ?? '',
    );
  }
}

extension OrderItemDtoMapper on OrderItemDto {
  OrderItemPreview toDomain() {
    return OrderItemPreview(
      name: productName,
      imageUrl: pictureUrl,
      quantity: quantity,
      price: price,
    );
  }
}

extension OrderDtoMapper on OrderDto {
  OrderModel toDomain() {
    OrderStatus parsedStatus = OrderStatus.processing;
    final lowerStatus = status.toLowerCase();
    if (lowerStatus.contains('delivered') || lowerStatus.contains('complete')) {
      parsedStatus = OrderStatus.delivered;
    } else if (lowerStatus.contains('cancel')) {
      parsedStatus = OrderStatus.cancelled;
    } else if (lowerStatus.contains('ship')) {
      parsedStatus = OrderStatus.shipped;
    }

    String formattedDate = orderDate;
    try {
      final parsed = DateTime.parse(orderDate);
      formattedDate = DateFormat('dd MMM yyyy').format(parsed);
    } catch (_) {}

    final domainItems = items.map((i) => i.toDomain()).toList();
    final totalCount = items.fold<int>(0, (sum, i) => sum + i.quantity);

    return OrderModel(
      id: id.toString(),
      orderNumber: id.toString(),
      status: parsedStatus,
      statusText: status.isNotEmpty ? status : 'Processing',
      date: formattedDate.isNotEmpty ? formattedDate : 'Recent',
      itemCount: totalCount > 0 ? totalCount : domainItems.length,
      deliveryType: deliveryMethod.isNotEmpty ? deliveryMethod : 'Express',
      deliveryCost: deliveryCost,
      subTotal: subTotal,
      total: total,
      previewItems: domainItems,
      shippingAddress: shippingAddress.toDomain(),
    );
  }
}

extension DeliveryMethodDtoMapper on DeliveryMethodDto {
  DeliveryMethodModel toDomain() {
    return DeliveryMethodModel(
      id: id,
      shortName: shortName,
      description: description,
      cost: cost,
      deliveryTime: deliveryTime,
    );
  }
}

