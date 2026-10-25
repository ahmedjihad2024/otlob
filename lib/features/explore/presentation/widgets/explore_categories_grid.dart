import 'package:flutter/material.dart';

class ExploreCategoryItem {
  final String id;
  final String name;
  final String emoji;
  final Color backgroundColor;

  const ExploreCategoryItem({
    required this.id,
    required this.name,
    required this.emoji,
    required this.backgroundColor,
  });
}

class ExploreCategoriesGrid extends StatelessWidget {
  const ExploreCategoriesGrid({
    super.key,
    this.onSelectCategory,
    this.categories = defaultCategories,
  });

  final ValueChanged<ExploreCategoryItem>? onSelectCategory;
  final List<ExploreCategoryItem> categories;

  static const List<ExploreCategoryItem> defaultCategories = [
    ExploreCategoryItem(
      id: '1',
      name: 'Frappuccino',
      emoji: '🥤',
      backgroundColor: Color(0xFFFFF0F0),
    ),
    ExploreCategoryItem(
      id: '2',
      name: 'Latte',
      emoji: '☕',
      backgroundColor: Color(0xFFFFF9E6),
    ),
    ExploreCategoryItem(
      id: '3',
      name: 'Mocha',
      emoji: '🍫',
      backgroundColor: Color(0xFFF3F4F6),
    ),
    ExploreCategoryItem(
      id: '4',
      name: 'Macchiato',
      emoji: '☕',
      backgroundColor: Color(0xFFF5F3FF),
    ),
    ExploreCategoryItem(
      id: '5',
      name: 'Matcha',
      emoji: '🍵',
      backgroundColor: Color(0xFFECFDF5),
    ),
    ExploreCategoryItem(
      id: '6',
      name: 'Cake',
      emoji: '🍰',
      backgroundColor: Color(0xFFFDF2F8),
    ),
    ExploreCategoryItem(
      id: 'donuts',
      name: 'Donuts',
      emoji: '🍩',
      backgroundColor: Color(0xFFFFF7ED),
    ),
    ExploreCategoryItem(
      id: 'salad',
      name: 'Salad',
      emoji: '🥗',
      backgroundColor: Color(0xFFEFF6FF),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "CATEGORIES",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF9CA3AF),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 169 / 71.5,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return InkWell(
              onTap: () => onSelectCategory?.call(category),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: category.backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Text(
                      category.emoji,
                      style: const TextStyle(fontSize: 22),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        category.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF111827),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
