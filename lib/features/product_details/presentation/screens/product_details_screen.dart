import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlob/core/di/dependency_injection.dart';
import 'package:otlob/core/res/color_manager.dart';
import 'package:otlob/core/res/sizes_manager.dart';
import 'package:otlob/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:otlob/features/product_details/presentation/cubit/product_details_state.dart';
import 'package:otlob/shared/cart/cart_helper.dart';
import 'package:otlob/shared/products/domain/model/product_item.dart';

import '../widgets/custom_divider.dart';
import '../widgets/description.dart';
import '../widgets/my_button_bar.dart';
import '../widgets/price.dart';
import '../widgets/product_type_selector.dart';
import '../widgets/top_app_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;
  final ProductItem? initialProduct;

  const ProductDetailsScreen({
    super.key,
    this.productId = 1,
    this.initialProduct,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductDetailsCubit>()
        ..loadProduct(productId, initialProduct: initialProduct),
      child: _ProductDetailsView(productId: productId),
    );
  }
}

class _ProductDetailsView extends StatelessWidget {
  final int productId;

  const _ProductDetailsView({required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: ColorM.primary),
            );
          }

          if (state is ProductDetailsError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.grey),
                  const SizedBox(height: 12),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: Color(0xFF4B5563)),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<ProductDetailsCubit>()
                          .loadProduct(productId);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorM.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }

          if (state is ProductDetailsLoaded) {
            final product = state.product;
            final quantity = state.quantity;
            final selectedType = state.selectedType;
            final cubit = context.read<ProductDetailsCubit>();

            final types = [
              if (product.brand.isNotEmpty) product.brand,
              if (product.category.isNotEmpty) product.category,
            ];

            return Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      TopAppBar(
                        imageUrl: product.pictureUrl.isNotEmpty
                            ? product.pictureUrl
                            : null,
                      ),
                      Positioned.fill(
                        top: 340,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 16),
                                      const CustomDivider(),
                                      const SizedBox(height: 14),
                                      if (types.isNotEmpty) ...[
                                        ProductTypeSelector(
                                          types: types,
                                          selectedType: selectedType,
                                          onSelected: (index) =>
                                              cubit.selectType(index),
                                        ),
                                        const SizedBox(height: 14),
                                      ],
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: SizeM.pagePadding,
                                        ),
                                        child: Text(
                                          product.name,
                                          style: const TextStyle(
                                            color: Color(0xFF111827),
                                            fontSize: 26,
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: -0.75,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Price(price: product.price),
                                      const SizedBox(height: 12),
                                      const Divider(
                                        indent: SizeM.pagePadding,
                                        endIndent: SizeM.pagePadding,
                                        color: Color(0xFFE5E7EB),
                                        height: 1,
                                      ),
                                      const SizedBox(height: 16),
                                      Description(
                                        description: product.description,
                                      ),
                                      const SizedBox(height: 24),
                                    ],
                                  ),
                                ),
                              ),
                              MyButtonBar(
                                quantity: quantity,
                                unitPrice: product.price,
                                onDecrease: () => cubit.decrementQuantity(),
                                onIncrease: () => cubit.incrementQuantity(),
                                onAddToCart: () {
                                  final pId = int.tryParse(product.id) ?? 1;
                                  addProductToCartHelper(
                                    context: context,
                                    productId: pId,
                                    productName: product.name,
                                    quantity: quantity,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
