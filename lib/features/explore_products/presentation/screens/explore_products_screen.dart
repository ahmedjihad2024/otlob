import 'dart:async';

import 'package:animated_visibility/animated_visibility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlob/shared/cart/cart_helper.dart';
import 'package:otlob/core/di/dependency_injection.dart';
import 'package:otlob/core/extensions/navigation_extension.dart';
import 'package:otlob/core/ui_kit/customized_smart_refresh.dart';
import 'package:otlob/features/explore_products/presentation/cubit/cubit/explor_products_cubit_cubit.dart';
import 'package:otlob/shared/widgets/product_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../widgets/explore_app_bar.dart';
import '../widgets/search_and_filter_bar.dart';
import '../widgets/sort_chips.dart';

enum ExplorType { brands, categories }

class ExploreProductsArgs {
  final String title;
  final ExplorType? explorType;
  final int? id;

  const ExploreProductsArgs({
    this.title = 'Products',
    this.explorType,
    this.id,
  });
}

class ExploreProductsScreen extends StatelessWidget {
  const ExploreProductsScreen({
    super.key,
    this.title = 'Products',
    this.explorType,
    this.id,
  });

  final String title;
  final ExplorType? explorType;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ExplorProductsCubitCubit>()
        ..configure(
          brandId: explorType == ExplorType.brands ? id : null,
          categoryId: explorType == ExplorType.categories ? id : null,
        )
        ..getProducts(refresh: true),
      child: _ExploreProductsView(title: title),
    );
  }
}

class _ExploreProductsView extends StatefulWidget {
  const _ExploreProductsView({required this.title});

  final String title;

  @override
  State<_ExploreProductsView> createState() => _ExploreProductsViewState();
}

class _ExploreProductsViewState extends State<_ExploreProductsView> {
  final ValueNotifier<bool> isFilterVisible = ValueNotifier<bool>(true);
  final TextEditingController _searchController = TextEditingController();
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  Timer? _debounceTimer;

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      context.read<ExplorProductsCubitCubit>().search(query);
    });
  }

  Future<void> _onRefresh() async {
    final outcome = await context.read<ExplorProductsCubitCubit>().getProducts(
      refresh: true,
    );
    if (!mounted) return;

    if (outcome == ExploreLoadOutcome.failed) {
      _refreshController.refreshFailed();
    } else {
      _refreshController.refreshCompleted();
      _refreshController.resetNoData();
    }
  }

  Future<void> _onLoading() async {
    final outcome = await context.read<ExplorProductsCubitCubit>().getProducts();
    if (!mounted) return;

    switch (outcome) {
      case ExploreLoadOutcome.failed:
        _refreshController.loadFailed();
      case ExploreLoadOutcome.noData:
        _refreshController.loadNoData();
      case ExploreLoadOutcome.success:
        _refreshController.loadComplete();
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchController.dispose();
    _refreshController.dispose();
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
              controller: _searchController,
              onChanged: _onSearchChanged,
              onTapFilter: () {
                isFilterVisible.value = !isFilterVisible.value;
              },
            ),
            ValueListenableBuilder<bool>(
              valueListenable: isFilterVisible,
              builder: (context, visible, _) {
                return AnimatedVisibility(
                  visible: visible,
                  enter:
                      fadeIn(curve: Curves.fastEaseInToSlowEaseOut) +
                      expandVertically(curve: Curves.fastEaseInToSlowEaseOut),
                  exit:
                      fadeOut(curve: Curves.fastEaseInToSlowEaseOut) +
                      shrinkVertically(curve: Curves.fastEaseInToSlowEaseOut),
                  enterDuration: const Duration(milliseconds: 300),
                  exitDuration: const Duration(milliseconds: 250),
                  child: BlocSelector<
                    ExplorProductsCubitCubit,
                    ExplorProductsCubitState,
                    int
                  >(
                    selector: (state) => state.selectedSortIndex,
                    builder: (context, selectedSortIndex) {
                      return SortChips(
                        selectedIndex: selectedSortIndex,
                        onSelected: (index) {
                          context.read<ExplorProductsCubitCubit>().changeSort(
                            index,
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
            Expanded(
              child:
                  BlocBuilder<ExplorProductsCubitCubit, ExplorProductsCubitState>(
                    builder: (context, state) => _buildBody(state),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(ExplorProductsCubitState state) {
    const primaryColor = Color(0xFFFF5C39);

    if (state.status == ExploreProductsStatus.loading ||
        state.status == ExploreProductsStatus.initial) {
      return const Center(
        child: CircularProgressIndicator(color: primaryColor),
      );
    }

    if (state.status == ExploreProductsStatus.failure) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline_rounded,
                size: 54,
                color: Color(0xFFEF4444),
              ),
              const SizedBox(height: 12),
              Text(
                state.errorMessage ?? 'Something went wrong',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4B5563),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.read<ExplorProductsCubitCubit>().getProducts(
                    refresh: true,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Try Again",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (state.products.isEmpty) {
      return CustomizedSmartRefresh(
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        enableLoading: true,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.18),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.search_off_rounded,
                      size: 36,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "No products found",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Try adjusting your filters or search keywords",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return CustomizedSmartRefresh(
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      enableLoading: true,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Text(
                "${state.products.length} items",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF9CA3AF),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 171 / 244,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final product = state.products[index];
                return ProductCard(
                  product: product,
                  badgeText: product.brand,
                  isFilterStyle: true,
                  onTap: () {
                    context.pushNamed(Routes.productDetails, arguments: product);
                  },
                  onAddToCart: () {
                    final int productId = int.tryParse(product.id) ?? 1;
                    addProductToCartHelper(
                      context: context,
                      productId: productId,
                      productName: product.title,
                      quantity: 1,
                    );
                  },
                );
              }, childCount: state.products.length),
            ),
          ),
        ],
      ),
    );
  }
}
