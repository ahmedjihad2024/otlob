import 'package:flutter/material.dart';
import 'package:otlob/core/res/sizes_manager.dart';

export 'package:otlob/shared/products/domain/model/category_item.dart';
import 'package:otlob/shared/products/domain/model/category_item.dart';

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
    CategoryItem(
      id: '1',
      name: 'Frappuccino',
      pictureUrl: 'https://talabat639.runasp.net/images/products/Frappuccino.jpg',
      emoji: '🥤',
    ),
    CategoryItem(
      id: '2',
      name: 'Latte',
      pictureUrl: 'https://talabat639.runasp.net/images/products/Latte.jpg',
      emoji: '☕',
    ),
    CategoryItem(
      id: '3',
      name: 'Mocha',
      pictureUrl: 'https://talabat639.runasp.net/images/products/Mocha.jpg',
      emoji: '🍫',
    ),
    CategoryItem(
      id: '4',
      name: 'Macchiato',
      pictureUrl: 'https://talabat639.runasp.net/images/products/Macchiato.jpg',
      emoji: '🥛',
    ),
    CategoryItem(
      id: '5',
      name: 'Matcha',
      pictureUrl: 'https://talabat639.runasp.net/images/products/Matcha.jpg',
      emoji: '🍵',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
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
            padding: const EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: (item.pictureUrl != null &&
                                  item.pictureUrl!.isNotEmpty)
                              ? Image.network(
                                  item.pictureUrl!,
                                  width: 72,
                                  height: 72,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, _, _) => Center(
                                    child: Text(
                                      item.displayEmoji,
                                      style: const TextStyle(fontSize: 28),
                                    ),
                                  ),
                                )
                              : Text(
                                  item.displayEmoji,
                                  style: const TextStyle(fontSize: 28),
                                ),
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
