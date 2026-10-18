import 'package:flutter/material.dart';
import 'package:otlob/core/res/app_sizes.dart';

import '../widgets/custom_divider.dart';
import '../widgets/description.dart';
import '../widgets/my_button_bar.dart';
import '../widgets/price.dart';
import '../widgets/product_type_selector.dart';
import '../widgets/top_app_bar.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedType = 0;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                const TopAppBar(),
                Container(
                  margin: const EdgeInsets.only(top: 340),
                  width: double.infinity,
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
                      const SizedBox(height: 16),
                      const CustomDivider(),
                      const SizedBox(height: 14),
                      ProductTypeSelector(
                        selectedType: selectedType,
                        onSelected: (index) {
                          setState(() => selectedType = index);
                        },
                      ),
                      const SizedBox(height: 14),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.padding,
                        ),
                        child: Text(
                          "Glazed Donuts",
                          style: TextStyle(
                            color: Color(0xFF111827),
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.75,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Price(),
                      const SizedBox(height: 12),
                      const Divider(
                        indent: AppSizes.padding,
                        endIndent: AppSizes.padding,
                        color: Color(0xFFE5E7EB),
                        height: 1,
                      ),
                      const SizedBox(height: 16),
                      const Description(),
                      
                      const Spacer(),
                      
                      MyButtonBar(
                        quantity: quantity,
                        onDecrease: () {
                          if (quantity > 1) setState(() => quantity--);
                        },
                        onIncrease: () {
                          setState(() => quantity++);
                        },
                        onAddToCart: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
