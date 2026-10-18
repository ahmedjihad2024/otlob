import 'package:flutter/material.dart';
import 'package:otlob/features/home/presentation/widgets/app_bar.dart';
import 'package:otlob/features/home/presentation/widgets/brands_section.dart';
import 'package:otlob/features/home/presentation/widgets/categories_section.dart';
import 'package:otlob/features/home/presentation/widgets/hero_banner.dart';
import 'package:otlob/features/home/presentation/widgets/popular_section.dart';
import 'package:otlob/features/explore_products/presentation/screens/explore_products_screen.dart';
import 'package:otlob/features/product_details/presentation/screens/product_details_screen.dart';

class HomeTapScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeTapScreen> createState() => _HomeTapScreenState();
}

class _HomeTapScreenState extends State<HomeTapScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            MyAppBar(
              userName: "Ahmed Jihad",
              location: "14 Tahrir Square, Cairo",
              isThereIsNotifications: true,
              onTapNotification: () {},
              onTapLocation: () {},
              onTapSearch: () {},
              onTapFilter: () {},
            ),
            const SizedBox(height: 20),
            HeroBanner(onTap: () {}),
            const SizedBox(height: 24),
            CategoriesSection(
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
              onSeeAll: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        const ExploreProductsScreen(title: "All Products"),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            BrandsSection(
              onSelectBrand: (brand) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ExploreProductsScreen(
                      title: brand,
                      brand: brand,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            PopularSection(
              onSelectProduct: (product) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ProductDetailsScreen()),
                );
              },
              onAddToCart: (product) {},
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
