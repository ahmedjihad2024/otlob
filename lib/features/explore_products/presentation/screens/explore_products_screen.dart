import 'package:animated_visibility/animated_visibility.dart';
import 'package:flutter/material.dart';
import 'package:otlob/core/res/assets.dart';
import 'package:otlob/features/product_details/presentation/screens/product_details_screen.dart';
import 'package:otlob/shared/widgets/product_card.dart';

import '../widgets/explore_app_bar.dart';
import '../widgets/search_and_filter_bar.dart';
import '../widgets/sort_chips.dart';

class ExploreProductsScreen extends StatefulWidget {
  const ExploreProductsScreen({
    super.key,
    this.title = 'Costa',
    this.brand,
    this.category,
  });

  final String title;
  final String? brand;
  final String? category;

  @override
  State<ExploreProductsScreen> createState() => _ExploreProductsScreenState();
}

class _ExploreProductsScreenState extends State<ExploreProductsScreen> {
  final ValueNotifier<bool> isFilterVisible = ValueNotifier<bool>(true);
  int selectedSortIndex = 0;

  static const List<ProductItem> products = [
    ProductItem(
      id: 'costa_1',
      brand: 'Costa',
      title: 'Vanilla Latte',
      category: 'Latte',
      price: 120,
      imageAsset: AppAssets.vanillaLatte,
    ),
    ProductItem(
      id: 'costa_2',
      brand: 'Costa',
      title: 'Dark Chocolate Mocha',
      category: 'Mocha',
      price: 145,
      imageAsset: AppAssets.darkChocolateMocha,
    ),
  ];

  @override
  void dispose() {
    isFilterVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExploreAppBar(title: widget.title),
            SearchAndFilterBar(
              onTapFilter: () {
                isFilterVisible.value = !isFilterVisible.value;
              },
            ),
            ValueListenableBuilder<bool>(
              valueListenable: isFilterVisible,
              builder: (context, visible, _) {
                return AnimatedVisibility(
                  visible: visible,
                  enter: fadeIn(curve: Curves.fastEaseInToSlowEaseOut) +
                      expandVertically(curve: Curves.fastEaseInToSlowEaseOut),
                  exit: fadeOut(curve: Curves.fastEaseInToSlowEaseOut) +
                      shrinkVertically(curve: Curves.fastEaseInToSlowEaseOut),
                  enterDuration: const Duration(milliseconds: 300),
                  exitDuration: const Duration(milliseconds: 250),
                  child: SortChips(
                    selectedIndex: selectedSortIndex,
                    onSelected: (index) {
                      setState(() => selectedSortIndex = index);
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Text(
                "${products.length} items",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF9CA3AF),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 171 / 244,
                ),
                itemBuilder: (context, index) {
                  final product = products[index % 2];
                  return ProductCard(
                    product: product,
                    badgeText: product.brand,
                    isFilterStyle: true,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ProductDetailsScreen(),
                        ),
                      );
                    },
                    onAddToCart: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
