import 'package:flutter/material.dart';
import 'package:otlob/core/res/app_sizes.dart';

class CategoryItem {
  final String id;
  final String name;
  final String emoji;

  const CategoryItem({
    required this.id,
    required this.name,
    required this.emoji,
  });
}

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
    this.selectedCategoryId,
    this.onSelectCategory,
    this.onSeeAll,
    this.categories = defaultCategories,
  });

  final String? selectedCategoryId;
  final ValueChanged<CategoryItem>? onSelectCategory;
  final VoidCallback? onSeeAll;
  final List<CategoryItem> categories;

  static const List<CategoryItem> defaultCategories = [
    CategoryItem(id: 'frappuccino', name: 'Frappuccino', emoji: '🥤'),
    CategoryItem(id: 'latte', name: 'Latte', emoji: '☕'),
    CategoryItem(id: 'mocha', name: 'Mocha', emoji: '🍫'),
    CategoryItem(id: 'macchiato', name: 'Macchiato', emoji: '🥛'),
    CategoryItem(id: 'matcha', name: 'Matcha', emoji: '🍵'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111827),
                  letterSpacing: -0.2,
                ),
              ),
              InkWell(
                onTap: onSeeAll,
                borderRadius: BorderRadius.circular(8),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFF6B4A),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 104,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: categories.length,
            separatorBuilder: (_, _) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final item = categories[index];
              return InkWell(
                onTap: () => onSelectCategory?.call(item),
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  width: 72,
                  child: Column(
                    children: [
                      Container(
                        width: 72,
                        height: 72,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFFF3F4F6),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.03),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Text(
                          item.emoji,
                          style: const TextStyle(fontSize: 28),
                        ),
                      ),
                      const SizedBox(height: 8),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF374151),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
