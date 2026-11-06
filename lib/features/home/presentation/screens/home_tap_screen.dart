import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlob/core/di/dependency_injection.dart';
import 'package:otlob/core/extensions/navigation_extension.dart';
import 'package:otlob/core/res/color_manager.dart';
import 'package:otlob/core/services/storage_services/storage_service.dart';
import 'package:otlob/features/explore_products/presentation/screens/explore_products_screen.dart';
import 'package:otlob/features/home/presentation/cubit/home_cubit.dart';
import 'package:otlob/features/home/presentation/cubit/home_state.dart';
import 'package:otlob/features/home/presentation/widgets/app_bar.dart';
import 'package:otlob/features/home/presentation/widgets/brands_section.dart';
import 'package:otlob/features/home/presentation/widgets/categories_section.dart';
import 'package:otlob/features/home/presentation/widgets/hero_banner.dart';
import 'package:otlob/features/home/presentation/widgets/home_shimmer_loading.dart';
import 'package:otlob/features/home/presentation/widgets/popular_section.dart';
import 'package:otlob/shared/cart/cart_helper.dart';

class HomeTapScreen extends StatelessWidget {
  const HomeTapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeCubit>()..getHomeData(),
      child: const _HomeTapView(),
    );
  }
}

class _HomeTapView extends StatefulWidget {
  const _HomeTapView();

  @override
  State<_HomeTapView> createState() => _HomeTapViewState();
}

class _HomeTapViewState extends State<_HomeTapView>
    with AutomaticKeepAliveClientMixin {
  String _userName = 'Ahmed Jihad';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  void _loadUserName() {
    final userMap = sl<StorageService>().getMap('user_name');
    if (userMap != null && userMap['name'] != null) {
      if (mounted) {
        setState(() {
          _userName = userMap['name'] as String;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.status.isError && state.errorMessage != null) {
          final hasData = state.products.isNotEmpty ||
              state.brands.isNotEmpty ||
              state.categories.isNotEmpty;
          if (hasData) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: ColorM.danger,
              ),
            );
          }
        }
      },
      builder: (context, state) {
        final hasAnyData = state.products.isNotEmpty ||
            state.brands.isNotEmpty ||
            state.categories.isNotEmpty;

        if (state.status.isLoading && !hasAnyData) {
          return const HomeShimmerLoading();
        }

        if (state.status.isError && !hasAnyData) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline_rounded,
                    size: 52,
                    color: ColorM.danger,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    state.errorMessage ?? 'Something went wrong',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0A192F),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<HomeCubit>().getHomeData(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorM.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            ),
          );
        }

        return SafeArea(
          bottom: false,
          child: RefreshIndicator(
            onRefresh: () =>
                context.read<HomeCubit>().getHomeData(refresh: true),
            color: ColorM.primary,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  MyAppBar(
                    userName: _userName,
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
                    categories: state.categories.isEmpty
                        ? CategoriesSection.defaultCategories
                        : state.categories,
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
                    onSeeAll: () {},
                  ),
                  const SizedBox(height: 24),
                  BrandsSection(
                    brands: state.brands.isEmpty
                        ? BrandsSection.defaultBrands
                        : state.brands,
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
                    products: state.products.isEmpty
                        ? PopularSection.defaultProducts
                        : state.products,
                    onSelectProduct: (product) {
                      context.pushNamed(
                        Routes.productDetails,
                        arguments: product,
                      );
                    },
                    onAddToCart: (product) {
                      final int productId = int.tryParse(product.id) ?? 1;
                      addProductToCartHelper(
                        context: context,
                        productId: productId,
                        productName: product.title,
                        quantity: 1,
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
