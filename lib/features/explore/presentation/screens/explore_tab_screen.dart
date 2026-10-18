import 'package:flutter/material.dart';
import 'package:otlob/core/res/app_sizes.dart';
import 'package:otlob/features/explore_products/presentation/screens/explore_products_screen.dart';

import '../widgets/explore_brands_list.dart';
import '../widgets/explore_categories_grid.dart';
import '../widgets/explore_header.dart';

class ExploreTabScreen extends StatefulWidget {
  const ExploreTabScreen({super.key});

  @override
  State<ExploreTabScreen> createState() => _ExploreTabScreenState();
}

class _ExploreTabScreenState extends State<ExploreTabScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.padding,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ExploreHeader(),
              const SizedBox(height: 24),
              ExploreCategoriesGrid(
                onSelectCategory: (category) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ExploreProductsScreen(
                        title: category.name,
                        category: category.name,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              ExploreBrandsList(
                onSelectBrand: (brand) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ExploreProductsScreen(
                        title: brand.name,
                        brand: brand.name,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
