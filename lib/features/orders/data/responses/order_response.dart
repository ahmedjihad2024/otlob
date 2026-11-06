class ShippingAddressDto {
  final String firstName;
  final String lastName;
  final String street;
  final String city;
  final String country;

  const ShippingAddressDto({
    this.firstName = '',
    this.lastName = '',
    this.street = '',
    this.city = '',
    this.country = '',
  });

  factory ShippingAddressDto.fromJson(Map<String, dynamic> json) {
    return ShippingAddressDto(
      firstName: (json['firstName'] ?? '') as String,
      lastName: (json['lastName'] ?? '') as String,
      street: (json['street'] ?? '') as String,
      city: (json['city'] ?? '') as String,
      country: (json['country'] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'street': street,
        'city': city,
        'country': country,
      };
}

class OrderItemDto {
  final int id;
  final int productId;
  final String productName;
  final String pictureUrl;
  final int quantity;
  final double price;

  const OrderItemDto({
    this.id = 0,
    this.productId = 0,
    this.productName = '',
    this.pictureUrl = '',
    this.quantity = 1,
    this.price = 0.0,
  });

  factory OrderItemDto.fromJson(Map<String, dynamic> json) {
    return OrderItemDto(
      id: (json['id'] as num?)?.toInt() ?? 0,
      productId: (json['productId'] as num?)?.toInt() ?? 0,
      productName: (json['productName'] ?? '') as String,
      pictureUrl: (json['pictureUrl'] ?? '') as String,
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'productId': productId,
        'productName': productName,
        'pictureUrl': pictureUrl,
        'quantity': quantity,
        'price': price,
      };
}

class OrderDto {
  final int id;
  final String buyerEmail;
  final ShippingAddressDto? shippingAddress;
  final String status;
  final String orderDate;
  final List<OrderItemDto> items;
  final String deliveryMethod;
  final double deliveryCost;
  final double subTotal;
  final double total;
  final String paymentIntentId;

  const OrderDto({
    this.id = 0,
    this.buyerEmail = '',
    this.shippingAddress,
    this.status = '',
    this.orderDate = '',
    this.items = const [],
    this.deliveryMethod = '',
    this.deliveryCost = 0.0,
    this.subTotal = 0.0,
    this.total = 0.0,
    this.paymentIntentId = '',
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'];
    return OrderDto(
      id: (json['id'] as num?)?.toInt() ?? 0,
      buyerEmail: (json['buyerEmail'] ?? '') as String,
      shippingAddress: json['shippingAddress'] != null
          ? ShippingAddressDto.fromJson(
              json['shippingAddress'] as Map<String, dynamic>,
            )
          : null,
      status: (json['status'] ?? '') as String,
      orderDate: (json['orderDate'] ?? '') as String,
      items: rawItems is List
          ? rawItems
              .map((i) => OrderItemDto.fromJson(i as Map<String, dynamic>))
              .toList()
          : const [],
      deliveryMethod: (json['deliveryMethod'] ?? '') as String,
      deliveryCost: (json['deliveryCost'] as num?)?.toDouble() ?? 0.0,
      subTotal: (json['subTotal'] as num?)?.toDouble() ?? 0.0,
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      paymentIntentId: (json['paymentIntentId'] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'buyerEmail': buyerEmail,
        if (shippingAddress != null)
          'shippingAddress': shippingAddress!.toJson(),
        'status': status,
        'orderDate': orderDate,
        'items': items.map((i) => i.toJson()).toList(),
        'deliveryMethod': deliveryMethod,
        'deliveryCost': deliveryCost,
        'subTotal': subTotal,
        'total': total,
        'paymentIntentId': paymentIntentId,
      };
}

class DeliveryMethodDto {
  final int id;
  final String shortName;
  final String description;
  final double cost;
  final String deliveryTime;

  const DeliveryMethodDto({
    this.id = 0,
    this.shortName = '',
    this.description = '',
    this.cost = 0.0,
    this.deliveryTime = '',
  });

  factory DeliveryMethodDto.fromJson(Map<String, dynamic> json) {
    return DeliveryMethodDto(
      id: (json['id'] as num?)?.toInt() ?? 0,
      shortName: (json['shortName'] ?? '') as String,
      description: (json['description'] ?? '') as String,
      cost: (json['cost'] as num?)?.toDouble() ?? 0.0,
      deliveryTime: (json['deliveryTime'] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'shortName': shortName,
        'description': description,
        'cost': cost,
        'deliveryTime': deliveryTime,
      };
}

