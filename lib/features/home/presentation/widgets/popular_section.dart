import 'package:flutter/material.dart';
import 'package:otlob/core/res/sizes_manager.dart';
import 'package:otlob/core/res/gen/assets.gen.dart';
import 'package:otlob/shared/widgets/product_card.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({
    super.key,
    this.products,
    this.onSelectProduct,
    this.onAddToCart,
  });

  final List<ProductItem>? products;
  final ValueChanged<ProductItem>? onSelectProduct;
  final ValueChanged<ProductItem>? onAddToCart;

  static final List<ProductItem> defaultProducts = [
    ProductItem(
      id: '1',
      brand: 'Starbucks',
      title: 'Double Caramel Frappuccino',
      category: 'Frappuccino',
      price: 200,
      imageAsset: Assets.images.doubleCaramelFrappuccino.path,
    ),
    ProductItem(
      id: '2',
      brand: 'Starbucks',
      title: 'Blueberry Cheesecake',
      category: 'Cake',
      price: 155,
      imageAsset: Assets.images.blueberryCheesecake.path,
    ),
    ProductItem(
      id: '3',
      brand: 'Starbucks',
      title: 'Double Caramel Frappuccino',
      category: 'Frappuccino',
      price: 200,
      imageAsset: Assets.images.doubleCaramelFrappuccino.path,
    ),
    ProductItem(
      id: '4',
      brand: 'Starbucks',
      title: 'Blueberry Cheesecake',
      category: 'Cake',
      price: 155,
      imageAsset: Assets.images.blueberryCheesecake.path,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final list = products ?? defaultProducts;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
          child: Text(
            "Popular right now",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
              letterSpacing: -0.2,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: list.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 160 / 294,
            ),
            itemBuilder: (context, index) {
              final product = list[index];
              return ProductCard(
                product: product,
                onTap: () => onSelectProduct?.call(product),
                onAddToCart: () => onAddToCart?.call(product),
              );
            },
          ),
        ),
      ],
    );
  }
}
