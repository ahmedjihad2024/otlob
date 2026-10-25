import 'package:flutter/material.dart';
import 'package:otlob/core/di/dependency_injection.dart';
import 'package:otlob/core/extensions/navigation_extension.dart';
import 'package:otlob/core/usecase/base.dart';
import 'package:otlob/features/explore_products/presentation/screens/explore_products_screen.dart';
import 'package:otlob/features/home/presentation/widgets/app_bar.dart';
import 'package:otlob/features/home/presentation/widgets/brands_section.dart';
import 'package:otlob/features/home/presentation/widgets/categories_section.dart';
import 'package:otlob/features/home/presentation/widgets/hero_banner.dart';
import 'package:otlob/features/home/presentation/widgets/popular_section.dart';
import 'package:otlob/shared/products/data/request/get_products_request.dart';
import 'package:otlob/shared/products/domain/usecase/get_brands_usecase.dart';
import 'package:otlob/shared/products/domain/usecase/get_categories_usecase.dart';
import 'package:otlob/shared/widgets/product_card.dart';

import 'package:otlob/shared/products/domain/usecase/get_products_usecase.dart';

class HomeTapScreen extends StatefulWidget {
  const HomeTapScreen({super.key});

  @override
  State<HomeTapScreen> createState() => _HomeTapScreenState();
}

class _HomeTapScreenState extends State<HomeTapScreen>
    with AutomaticKeepAliveClientMixin {
  List<ProductItem> products = [];
  List<BrandItem> brands = [];
  List<CategoryItem> categories = [];

  bool isLoading = false;
  final GetProductsUseCase _getProductsUseCase = sl<GetProductsUseCase>();
  final GetBrandsUseCase _getBrandsUseCase = sl<GetBrandsUseCase>();
  final GetCategoriesUseCase _getCategoriesUseCase = sl<GetCategoriesUseCase>();

  Future<void> getData() async {
    setState(() => isLoading = true);
    final results = await Future.wait([
      _getProductsUseCase.execute(const GetProductsRequest(pageSize: 4)),
      _getBrandsUseCase.execute(const NoParams()),
      _getCategoriesUseCase.execute(const NoParams()),
    ]);
    if (mounted) {
      isLoading = false;

      results[0].fold((_) {}, (r) => products = r as List<ProductItem>);
      results[1].fold((_) {}, (r) => brands = r as List<BrandItem>);
      results[2].fold((_) {}, (r) => categories = r as List<CategoryItem>);

      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : SafeArea(
            bottom: false,
            child: RefreshIndicator(
              onRefresh: getData,
              color: const Color(0xFFFF6B4A),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
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
                      onTapSearch: () {
                        context.pushNamed(
                          Routes.products,
                          arguments: const ExploreProductsArgs(
                            title: "Search Products",
                          ),
                        );
                      },
                      onTapFilter: () {},
                    ),
                    const SizedBox(height: 20),
                    HeroBanner(onTap: () {}),
                    const SizedBox(height: 24),
                    CategoriesSection(
                      categories: categories.isEmpty
                          ? CategoriesSection.defaultCategories
                          : categories,
                      onSelectCategory: (category) {
                        context.pushNamed(
                          Routes.products,
                          arguments: ExploreProductsArgs(
                            title: category.name,
                            explorType: ExplorType.categories,
                            id: int.tryParse(category.id) ?? 1,
                          ),
                        );
                      },
                      onSeeAll: () {
                      },
                    ),
                    const SizedBox(height: 24),
                    BrandsSection(
                      brands: brands.isEmpty
                          ? BrandsSection.defaultBrands
                          : brands,
                      onSelectBrand: (brand) {
                        context.pushNamed(
                          Routes.products,
                          arguments: ExploreProductsArgs(
                            title: brand.name,
                            explorType: ExplorType.brands,
                            id: brand.id,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    PopularSection(
                      products: products.isEmpty
                          ? PopularSection.defaultProducts
                          : products,
                      onSelectProduct: (product) {
                        context.pushNamed(Routes.productDetails);
                      },
                      onAddToCart: (product) {},
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          );
  }

  @override
  bool get wantKeepAlive => true;
}
