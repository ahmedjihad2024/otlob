import 'dart:async';

import 'package:animated_visibility/animated_visibility.dart';
import 'package:flutter/material.dart';
import 'package:otlob/core/di/dependency_injection.dart';
import 'package:otlob/core/extensions/navigation_extension.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/ui_kit/customized_smart_refresh.dart';
import 'package:otlob/shared/products/data/request/get_products_request.dart';
import 'package:otlob/shared/products/domain/usecase/get_products_usecase.dart';
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

class ExploreProductsScreen extends StatefulWidget {
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
  State<ExploreProductsScreen> createState() => _ExploreProductsScreenState();
}

class _ExploreProductsScreenState extends State<ExploreProductsScreen> {
  final ValueNotifier<bool> isFilterVisible = ValueNotifier<bool>(true);
  final TextEditingController _searchController = TextEditingController();
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  final GetProductsUseCase _getProductsUseCase = sl<GetProductsUseCase>();

  Timer? _debounceTimer;
  int selectedSortIndex = 0;
  bool isLoading = true;
  String? errorMessage;
  List<ProductItem> products = [];

  int currentPage = 0;

  String? _getSortQuery(int sortIndex) {
    switch (sortIndex) {
      case 1:
        return 'price';
      case 2:
        return 'price';
      case 3:
        return 'name';
      default:
        return null;
    }
  }

  Future<void> getProducts({bool refresh = false}) async {
    if (refresh) {
      setState(() {
        currentPage = 0;
        isLoading = true;
        errorMessage = null;
      });
    }

    final request = GetProductsRequest(
      pageIndex: ++currentPage,
      pageSize: 20,
      brandId: widget.explorType == ExplorType.brands ? widget.id : null,
      categoryId: widget.explorType == ExplorType.categories ? widget.id : null,
      sort: _getSortQuery(selectedSortIndex),
      search: _searchController.text.trim().isNotEmpty
          ? _searchController.text.trim()
          : null,
    );

    final result = await _getProductsUseCase.execute(request);

    if (!mounted) return;

    result.fold(
      (failure) {
        if (!refresh) {
          --currentPage;
          _refreshController.loadFailed();
        } else {
          setState(() {
            isLoading = false;
            errorMessage = failure.message;
          });
        }
      },
      (data) {
        setState(() {
          isLoading = false;
          if (refresh) {
            products = data;
            _refreshController.refreshCompleted();
          } else {
            products = [...products, ...data];
            if (data.isEmpty)
              _refreshController.loadNoData();
            else
              _refreshController.loadComplete();
          }
        });
      },
    );
  }

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      getProducts(refresh: true);
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts(refresh: true);
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
                  child: SortChips(
                    selectedIndex: selectedSortIndex,
                    onSelected: (index) {
                      if (selectedSortIndex != index) {
                        setState(() => selectedSortIndex = index);
                        getProducts();
                      }
                    },
                  ),
                );
              },
            ),
            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    const primaryColor = Color(0xFFFF5C39);

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: primaryColor),
      );
    }

    if (errorMessage != null) {
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
                errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4B5563),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: getProducts,
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

    if (products.isEmpty) {
      return CustomizedSmartRefresh(
        controller: _refreshController,
        onRefresh: () => getProducts(refresh: true),
        onLoading: getProducts,
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
      onRefresh: () => getProducts(refresh: true),
      onLoading: getProducts,
      enableLoading: true,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
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
                final product = products[index];
                return ProductCard(
                  product: product,
                  badgeText: product.brand,
                  isFilterStyle: true,
                  onTap: () {
                    context.pushNamed(Routes.productDetails);
                  },
                  onAddToCart: () {},
                );
              }, childCount: products.length),
            ),
          ),
        ],
      ),
    );
  }
}
