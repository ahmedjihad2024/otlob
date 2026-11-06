import 'package:equatable/equatable.dart';

enum OrderStatus {
  delivered,
  processing,
  shipped,
  cancelled,
}

class ShippingAddressModel extends Equatable {
  final String firstName;
  final String lastName;
  final String street;
  final String city;
  final String country;

  const ShippingAddressModel({
    this.firstName = '',
    this.lastName = '',
    this.street = '',
    this.city = '',
    this.country = '',
  });

  String get fullAddress =>
      [street, city, country].where((s) => s.isNotEmpty).join(', ');

  @override
  List<Object?> get props => [firstName, lastName, street, city, country];
}

class OrderItemPreview extends Equatable {
  final String name;
  final String? imageUrl;
  final String? assetPath;
  final int quantity;
  final double price;

  const OrderItemPreview({
    required this.name,
    this.imageUrl,
    this.assetPath,
    this.quantity = 1,
    this.price = 0.0,
  });

  @override
  List<Object?> get props => [name, imageUrl, assetPath, quantity, price];
}

class OrderModel extends Equatable {
  final String id;
  final String orderNumber;
  final OrderStatus status;
  final String statusText;
  final String date;
  final int itemCount;
  final String deliveryType;
  final double deliveryCost;
  final double subTotal;
  final double total;
  final List<OrderItemPreview> previewItems;
  final ShippingAddressModel? shippingAddress;

  const OrderModel({
    required this.id,
    required this.orderNumber,
    required this.status,
    required this.statusText,
    required this.date,
    required this.itemCount,
    required this.deliveryType,
    this.deliveryCost = 25.0,
    this.subTotal = 0.0,
    required this.total,
    required this.previewItems,
    this.shippingAddress,
  });

  @override
  List<Object?> get props => [
        id,
        orderNumber,
        status,
        statusText,
        date,
        itemCount,
        deliveryType,
        deliveryCost,
        subTotal,
        total,
        previewItems,
        shippingAddress,
      ];
}

class DeliveryMethodModel extends Equatable {
  final int id;
  final String shortName;
  final String description;
  final double cost;
  final String deliveryTime;

  const DeliveryMethodModel({
    required this.id,
    required this.shortName,
    required this.description,
    required this.cost,
    required this.deliveryTime,
  });

  @override
  List<Object?> get props => [id, shortName, description, cost, deliveryTime];
}
