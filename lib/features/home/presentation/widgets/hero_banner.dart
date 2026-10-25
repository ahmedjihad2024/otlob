import 'package:flutter/material.dart';
import 'package:otlob/core/res/sizes_manager.dart';

class BannerItem {
  final String id;
  final String badge;
  final String title;
  final String subtitle;
  final List<Color> gradientColors;
  final VoidCallback? onTap;

  const BannerItem({
    required this.id,
    required this.badge,
    required this.title,
    required this.subtitle,
    this.gradientColors = const [
      Color(0xFFFF5C39),
      Color(0xFFFF7253),
      Color(0xFFFF7C60),
    ],
    this.onTap,
  });
}

class HeroBanner extends StatelessWidget {
  const HeroBanner({
    super.key,
    this.onTap,
    this.banners = defaultBanners,
    this.controller,
  });

  final VoidCallback? onTap;
  final List<BannerItem> banners;
  final PageController? controller;

  static const List<BannerItem> defaultBanners = [
    BannerItem(
      id: '1',
      badge: "Limited offer",
      title: "Free delivery on\nyour first order",
      subtitle: "Use code BITE10 at checkout",
      gradientColors: [
        Color(0xFFFF5C39),
        Color(0xFFFF7253),
        Color(0xFFFF7C60),
      ],
    ),
    BannerItem(
      id: '2',
      badge: "Coffee hours",
      title: "Get 40% OFF on\nyour morning brew",
      subtitle: "Valid on all handcrafted beverages",
      gradientColors: [
        Color(0xFF3B2416),
        Color(0xFF5A3825),
        Color(0xFF7B4D34),
      ],
    ),
    BannerItem(
      id: '3',
      badge: "Dessert craving",
      title: "Buy 1 Get 1 Free\non sweet bakery",
      subtitle: "Fresh artisan cakes & pastries",
      gradientColors: [
        Color(0xFF1E293B),
        Color(0xFF334155),
        Color(0xFF475569),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (banners.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 176,
      child: PageView.builder(
        controller: controller,
        clipBehavior: Clip.none,
        itemCount: banners.length,
        itemBuilder: (context, index) {
          final banner = banners[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: SizeM.pagePadding),
            child: _buildBannerCard(
              context: context,
              banner: banner,
              cardIndex: index,
              totalCount: banners.length,
            ),
          );
        },
      ),
    );
  }

  Widget _buildBannerCard({
    required BuildContext context,
    required BannerItem banner,
    required int cardIndex,
    required int totalCount,
  }) {
    final primaryGradientColor = banner.gradientColors.isNotEmpty
        ? banner.gradientColors.first
        : const Color(0xFFFF5C39);

    return InkWell(
      onTap: banner.onTap ?? onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        height: 176,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: banner.gradientColors,
          ),
          boxShadow: [
            BoxShadow(
              color: primaryGradientColor.withValues(alpha: 0.28),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Positioned(
              right: -30,
              top: -40,
              child: Container(
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.08),
                ),
              ),
            ),
            Positioned(
              right: 40,
              bottom: -50,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.06),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.22),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      banner.badge,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    banner.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.2,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    banner.subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            if (totalCount > 1)
              Positioned(
                right: 20,
                bottom: 20,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(totalCount, (dotIndex) {
                    final isSelected = dotIndex == cardIndex;
                    return Container(
                      margin: EdgeInsets.only(
                        right: dotIndex == totalCount - 1 ? 0 : 6,
                      ),
                      width: isSelected ? 24 : 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(999),
                      ),
                    );
                  }),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
