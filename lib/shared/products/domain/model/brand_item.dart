class BrandItem {
  final int id;
  final String name;

  const BrandItem({
    required this.id,
    required this.name,
  });

  factory BrandItem.fromJson(Map<String, dynamic> json) {
    return BrandItem(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse(json['id']?.toString() ?? '0') ?? 0,
      name: (json['name'] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() => name;
}
