import 'package:flutter/material.dart';
import 'package:otlob/core/res/color_manager.dart';
import 'package:otlob/core/res/sizes_manager.dart';

class ProductTypeSelector extends StatelessWidget {
  const ProductTypeSelector({
    super.key,
    required this.selectedType,
    required this.onSelected,
    this.types = const ["Cilantro", "Donuts"],
  });

  final int selectedType;
  final ValueChanged<int> onSelected;
  final List<String> types;

  @override
  Widget build(BuildContext context) {
    if (types.isEmpty) return const SizedBox.shrink();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: [
          for (int i = 0; i < types.length; i++)
            ProductTypeCard(
              text: types[i],
              isSelected: selectedType == i,
              onTap: () => onSelected(i),
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
          border: Border.all(
            color: isSelected ? ColorM.primary : Colors.transparent,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? ColorM.primary : const Color(0xFF6B7280),
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
