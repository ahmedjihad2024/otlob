import 'package:equatable/equatable.dart';

enum OrderStatus {
  delivered,
  processing,
  shipped,
  cancelled,
}

class OrderItemPreview extends Equatable {
  final String name;
  final String? imageUrl;
  final String? assetPath;

  const OrderItemPreview({
    required this.name,
    this.imageUrl,
    this.assetPath,
  });

  @override
  List<Object?> get props => [name, imageUrl, assetPath];
}

class OrderModel extends Equatable {
  final String id;
  final String orderNumber;
  final OrderStatus status;
  final String statusText;
  final String date;
  final int itemCount;
  final String deliveryType;
  final double total;
  final List<OrderItemPreview> previewItems;

  const OrderModel({
    required this.id,
    required this.orderNumber,
    required this.status,
    required this.statusText,
    required this.date,
    required this.itemCount,
    required this.deliveryType,
    required this.total,
    required this.previewItems,
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
    total,
    previewItems,
  ];
}
