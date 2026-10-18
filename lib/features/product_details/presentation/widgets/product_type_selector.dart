import 'package:flutter/material.dart';
import 'package:otlob/core/res/app_colors.dart';
import 'package:otlob/core/res/app_sizes.dart';

class ProductTypeSelector extends StatelessWidget {
  const ProductTypeSelector({
    super.key,
    required this.selectedType,
    required this.onSelected,
  });

  final int selectedType;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: [
          ProductTypeCard(
            text: "Cilantro",
            isSelected: selectedType == 0,
            onTap: () => onSelected(0),
          ),
          ProductTypeCard(
            text: "Donuts",
            isSelected: selectedType == 1,
            onTap: () => onSelected(1),
          ),
        ],
      ),
    );
  }
}

class ProductTypeCard extends StatelessWidget {
  const ProductTypeCard({
    super.key,
    required this.text,
    this.isSelected = false,
    this.onTap,
  });

  final bool isSelected;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          color: isSelected ? const Color(0xFFFFF0ED) : const Color(0xFFF3F4F6),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            letterSpacing: 0.275,
            color: isSelected ? AppColors.primary : const Color(0xFF6B7280),
          ),
        ),
      ),
    );
  }
}
