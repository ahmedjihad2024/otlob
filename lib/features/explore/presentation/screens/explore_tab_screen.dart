import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:otlob/core/di/dependency_injection.dart';
import 'package:otlob/core/extensions/navigation_extension.dart';
import 'package:otlob/core/res/color_manager.dart';
import 'package:otlob/core/res/sizes_manager.dart';
import 'package:otlob/core/ui_kit/customized_smart_refresh.dart';
import 'package:otlob/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:otlob/features/explore/presentation/cubit/explore_state.dart';
import 'package:otlob/features/explore/presentation/widgets/explore_tab_shimmer.dart';
import 'package:otlob/features/explore_products/presentation/screens/explore_products_screen.dart';

import '../widgets/explore_brands_list.dart';
import '../widgets/explore_categories_grid.dart';
import '../widgets/explore_header.dart';

class ExploreTabScreen extends StatelessWidget {
  const ExploreTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ExploreCubit>()..loadExploreData(),
      child: const _ExploreTabView(),
    );
  }
}

class _ExploreTabView extends StatefulWidget {
  const _ExploreTabView();

  @override
  State<_ExploreTabView> createState() => _ExploreTabViewState();
}

class _ExploreTabViewState extends State<_ExploreTabView>
    with AutomaticKeepAliveClientMixin {
  late final RefreshController _refreshController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh(BuildContext context) async {
    await context.read<ExploreCubit>().loadExploreData();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        bottom: false,
        child: BlocConsumer<ExploreCubit, ExploreState>(
          listener: (context, state) {
            if (!state.isLoading) {
              _refreshController.refreshCompleted();
            }
          },
          builder: (context, state) {
            return CustomizedSmartRefresh(
              controller: _refreshController,
              onRefresh: () => _onRefresh(context),
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

                    if (state.isLoading && state.categories.isEmpty)
                      const ExploreTabShimmer()
                    else if (state.isError && state.categories.isEmpty)
                      _buildErrorView(context, state.errorMessage)
                    else ...[
                      ExploreCategoriesGrid(
                        categories: state.categories,
                        onSelectCategory: (category) {
                          context.pushNamed(
                            Routes.products,
                            extra: ExploreProductsArgs(
                              title: category.name,
                              explorType: ExplorType.categories,
                              id: int.tryParse(category.id),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      ExploreBrandsList(
                        brands: state.brands,
                        onSelectBrand: (brand) {
                          context.pushNamed(
                            Routes.products,
                            extra: ExploreProductsArgs(
                              title: brand.name,
                              explorType: ExplorType.brands,
                              id: brand.id,
                            ),
                          );
                        },
                      ),
                    ],
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildErrorView(BuildContext context, String? message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: Column(
          children: [
            const Icon(Icons.error_outline, size: 48, color: ColorM.danger),
            const SizedBox(height: 12),
            Text(
              message ?? 'Failed to load categories & brands',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<ExploreCubit>().loadExploreData(),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorM.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Try Again', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
