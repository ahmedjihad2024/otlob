import 'package:flutter/material.dart';
import 'package:otlob/core/extensions/navigation_extension.dart';
import 'package:otlob/core/res/sizes_manager.dart';
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
            horizontal: SizeM.pagePadding,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ExploreHeader(),
              const SizedBox(height: 24),
              ExploreCategoriesGrid(
                onSelectCategory: (category) {
                  context.pushNamed(
                    Routes.products,
                    arguments: ExploreProductsArgs(
                      title: category.name,
                      explorType: ExplorType.categories,
                      id: int.tryParse(category.id),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              ExploreBrandsList(
                onSelectBrand: (brand) {
                  context.pushNamed(
                    Routes.products,
                    arguments: ExploreProductsArgs(
                      title: brand.name,
                      explorType: ExplorType.brands,
                      id: int.tryParse(brand.id),
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
