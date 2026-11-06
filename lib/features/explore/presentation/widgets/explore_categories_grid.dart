import 'package:flutter/material.dart';
import 'package:otlob/shared/products/domain/model/category_item.dart';

class ExploreCategoriesGrid extends StatelessWidget {
  const ExploreCategoriesGrid({
    super.key,
    required this.categories,
    this.onSelectCategory,
  });

  final List<CategoryItem> categories;
  final ValueChanged<CategoryItem>? onSelectCategory;

  static const List<Color> _categoryColors = [
    Color(0xFFFFF0F0),
    Color(0xFFFFF9E6),
    Color(0xFFF3F4F6),
    Color(0xFFF5F3FF),
    Color(0xFFECFDF5),
    Color(0xFFFDF2F8),
    Color(0xFFFFF7ED),
    Color(0xFFEFF6FF),
  ];

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) return const SizedBox.shrink();

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
            final color = _categoryColors[index % _categoryColors.length];
            return InkWell(
              onTap: () => onSelectCategory?.call(category),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Text(
                      category.displayEmoji,
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
