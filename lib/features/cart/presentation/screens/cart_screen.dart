import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:otlob/core/di/dependency_injection.dart';
import 'package:otlob/core/extensions/navigation_extension.dart';
import 'package:otlob/core/res/color_manager.dart';
import 'package:otlob/core/ui_kit/customized_smart_refresh.dart';
import 'package:otlob/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:otlob/features/cart/presentation/cubit/cart_state.dart';
import 'package:otlob/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:otlob/features/cart/presentation/widgets/cart_shimmer_loading.dart';
import 'package:otlob/features/cart/presentation/widgets/order_summary_card.dart';

class CartScreen extends StatelessWidget {
  final VoidCallback? onExploreTap;

  const CartScreen({super.key, this.onExploreTap});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<CartCubit>()..loadBasket(),
      child: CartView(onExploreTap: onExploreTap),
    );
  }
}

class CartView extends StatefulWidget {
  final VoidCallback? onExploreTap;

  const CartView({super.key, this.onExploreTap});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final RefreshController _refreshController = RefreshController();

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  Future<void> _handleRefresh() async {
    await context.read<CartCubit>().loadBasket();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if (_refreshController.isRefresh) {
              _refreshController.refreshCompleted();
            }
            if (state is CartSuccess && state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorMessage!,
                    style: const TextStyle(fontFamily: 'Inter'),
                  ),
                  backgroundColor: ColorM.danger,
                  duration: const Duration(seconds: 2),
                ),
              );
              context.read<CartCubit>().clearErrorMessage();
            }
          },
          builder: (context, state) {
            if (state is CartLoading && !_refreshController.isRefresh) {
              return const CartShimmerLoading();
            }

            if (state is CartError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline_rounded,
                        size: 64,
                        color: ColorM.danger,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0A192F),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => context.read<CartCubit>().loadBasket(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorM.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Try Again',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is CartSuccess) {
              final basket = state.basket;

              if (basket.items.isEmpty) {
                return _buildEmptyState(context);
              }

              return Column(
                children: [
                  // Main scrollable content with CustomizedSmartRefresh
                  Expanded(
                    child: CustomizedSmartRefresh(
                      controller: _refreshController,
                      onRefresh: _handleRefresh,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Your Cart',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF0A192F),
                                      letterSpacing: -0.75,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${basket.itemCount} items · ${basket.total.toInt()} EGP',
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF6B7280),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Items List with swipe-to-delete to the left (local deletion only)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: basket.items.length,
                                separatorBuilder: (_, _) =>
                                    const SizedBox(height: 16),
                                itemBuilder: (context, index) {
                                  final item = basket.items[index];
                                  return Dismissible(
                                    key: ValueKey('cart_item_${item.id}'),
                                    direction: DismissDirection.endToStart,
                                    background: Container(
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.only(right: 24),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEF4444),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.delete_outline_rounded,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'Delete',
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onDismissed: (_) {
                                      // Local deletion only - do not call backend delete API
                                      context
                                          .read<CartCubit>()
                                          .removeItemLocally(item.id);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            '${item.productName} removed from cart',
                                            style: const TextStyle(
                                              fontFamily: 'Inter',
                                            ),
                                          ),
                                          backgroundColor:
                                              const Color(0xFF0A192F),
                                          duration: const Duration(seconds: 2),
                                        ),
                                      );
                                    },
                                    child: CartItemCard(
                                      item: item,
                                      isUpdating:
                                          state.updatingProductId == item.id,
                                      onIncrement: () {
                                        context
                                            .read<CartCubit>()
                                            .increaseQuantity(item.id);
                                      },
                                      onDecrement: () {
                                        context
                                            .read<CartCubit>()
                                            .decreaseQuantity(item.id);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Order Summary
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: OrderSummaryCard(basket: basket),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Bottom Sticky Checkout Button Area
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(
                          color: const Color(0xFFF3F4F6),
                          width: 1,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          offset: const Offset(0, -4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: SafeArea(
                      top: false,
                      child: SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            context.pushNamed(Routes.confirmOrder);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorM.primary,
                            elevation: 4,
                            shadowColor: ColorM.primary.withValues(alpha: 0.4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            'Proceed to Checkout · ${basket.total.toInt()} EGP',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFFFECE8),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 48,
                color: ColorM.primary,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Your Cart is Empty',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0A192F),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Looks like you haven\'t added any items to your cart yet.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: Color(0xFF9CA3AF),
              ),
            ),
            const SizedBox(height: 28),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  if (widget.onExploreTap != null) {
                    widget.onExploreTap!();
                  } else {
                    context.read<CartCubit>().loadBasket();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorM.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                ),
                child: const Text(
                  'Explore Menu',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
