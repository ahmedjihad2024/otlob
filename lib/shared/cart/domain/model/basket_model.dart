import 'package:equatable/equatable.dart';

class BasketItemModel extends Equatable {
  final int id;
  final String productName;
  final double price;
  final String pictureUrl;
  final String category;
  final String brand;
  final int quantity;

  const BasketItemModel({
    required this.id,
    required this.productName,
    required this.price,
    required this.pictureUrl,
    required this.category,
    required this.brand,
    required this.quantity,
  });

  double get totalPrice => price * quantity;

  BasketItemModel copyWith({
    int? id,
    String? productName,
    double? price,
    String? pictureUrl,
    String? category,
    String? brand,
    int? quantity,
  }) {
    return BasketItemModel(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      price: price ?? this.price,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      category: category ?? this.category,
      brand: brand ?? this.brand,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [
    id,
    productName,
    price,
    pictureUrl,
    category,
    brand,
    quantity,
  ];
}

class BasketModel extends Equatable {
  final String id;
  final List<BasketItemModel> items;

  const BasketModel({
    required this.id,
    required this.items,
  });

  int get totalQuantity => items.fold(0, (sum, item) => sum + item.quantity);
  int get itemCount => items.length;
  double get subtotal => items.fold(0.0, (sum, item) => sum + item.totalPrice);
  double get deliveryFee => items.isEmpty ? 0.0 : 25.0;
  double get total => subtotal + deliveryFee;

  BasketModel copyWith({
    String? id,
    List<BasketItemModel>? items,
  }) {
    return BasketModel(
      id: id ?? this.id,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [id, items];
}

