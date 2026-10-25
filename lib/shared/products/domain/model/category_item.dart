class CategoryItem {
  final String id;
  final String name;
  final String? emoji;
  final String? pictureUrl;

  const CategoryItem({
    required this.id,
    required this.name,
    this.emoji,
    this.pictureUrl,
  });

  String get displayEmoji => emoji ?? defaultEmojiFor(name);

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id']?.toString() ?? '',
      name: (json['name'] ?? '') as String,
      pictureUrl: json['pictureUrl'] as String?,
      emoji: json['emoji'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (pictureUrl != null) 'pictureUrl': pictureUrl,
      'emoji': emoji,
    };
  }

  static String defaultEmojiFor(String name) {
    switch (name.toLowerCase()) {
      case 'frappuccino':
        return '🥤';
      case 'latte':
        return '☕';
      case 'mocha':
        return '🍫';
      case 'macchiato':
        return '🥛';
      case 'matcha':
        return '🍵';
      case 'cake':
        return '🍰';
      case 'donuts':
        return '🍩';
      case 'salad':
        return '🥗';
      default:
        return '☕';
    }
  }
}
