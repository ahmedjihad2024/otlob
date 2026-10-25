class ProductItem {
  final String id;
  final String name;
  final String? description;
  final String pictureUrl;
  final double price;
  final int? brandId;
  final String brand;
  final int? categoryId;
  final String category;

  // Backwards compatibility aliases
  String get title => name;
  String get imageAsset => pictureUrl;

  const ProductItem({
    required this.id,
    String? name,
    String? title,
    this.description,
    String? pictureUrl,
    String? imageAsset,
    required this.price,
    this.brandId,
    required this.brand,
    this.categoryId,
    required this.category,
  })  : name = name ?? title ?? '',
        pictureUrl = pictureUrl ?? imageAsset ?? '';

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      id: json['id']?.toString() ?? '',
      name: (json['name'] ?? json['title'] ?? '') as String,
      description: json['description'] as String?,
      pictureUrl: (json['pictureUrl'] ?? json['imageAsset'] ?? '') as String,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      brandId: json['brandId'] as int?,
      brand: (json['brand'] ?? '') as String,
      categoryId: json['categoryId'] as int?,
      category: (json['category'] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (description != null) 'description': description,
      'pictureUrl': pictureUrl,
      'price': price,
      if (brandId != null) 'brandId': brandId,
      'brand': brand,
      if (categoryId != null) 'categoryId': categoryId,
      'category': category,
    };
  }
}
