import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otlob/core/res/gen/assets.gen.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.cartCount = 4,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;
  final int cartCount;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                index: 0,
                iconAsset: Assets.svg.navHome.path,
                label: "Home",
              ),
              _buildNavItem(
                index: 1,
                iconAsset: Assets.svg.navExplore.path,
                label: "Explore",
              ),
              _buildNavItem(
                index: 2,
                iconAsset: Assets.svg.navCart.path,
                label: "Cart",
                badgeCount: cartCount,
              ),
              _buildNavItem(
                index: 3,
                iconAsset: Assets.svg.navOrders.path,
                label: "Orders",
              ),
              _buildNavItem(
                index: 4,
                iconAsset: Assets.svg.navProfile.path,
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String iconAsset,
    required String label,
    int? badgeCount,
  }) {
    final isActive = currentIndex == index;
    final color = isActive ? const Color(0xFFFF5C39) : const Color(0xFF999999);

    return InkWell(
      onTap: () => onTap(index),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Center(
                    child: SvgPicture.asset(
                      iconAsset,
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                    ),
                  ),
                ),
                if (badgeCount != null && badgeCount > 0)
                  Positioned(
                    top: -4,
                    right: -8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 1.5,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF5C39),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                      child: Text(
                        badgeCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          height: 1.1,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
