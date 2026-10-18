import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otlob/core/res/app_sizes.dart';
import 'package:otlob/core/res/assets.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.userName,
    required this.location,
    this.isThereIsNotifications = false,
    this.onTapNotification,
    this.onTapLocation,
    this.onTapFilter,
    this.onTapSearch,
  });

  final VoidCallback? onTapNotification;
  final VoidCallback? onTapLocation;
  final VoidCallback? onTapFilter;
  final VoidCallback? onTapSearch;
  final bool isThereIsNotifications;
  final String userName;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    "Good evening 🥐",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6B7280),
                    ),
                  ),

                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF111827),
                    ),
                  ),
                ],
              ),

              IconButton(
                onPressed: onTapNotification,
                style: ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(Size(48, 48)),
                  elevation: WidgetStatePropertyAll(10),
                  shadowColor: WidgetStatePropertyAll(Colors.black26),
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                icon: Stack(
                  alignment: .center,
                  clipBehavior: Clip.none,
                  children: [
                    SvgPicture.asset(AppAssets.bellIcon, width: 20, height: 20),

                    if (isThereIsNotifications)
                      Positioned(
                        top: -3,
                        right: -4,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          InkWell(
            onTap: onTapLocation,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 9),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF5F3),
                borderRadius: BorderRadius.circular(999999),
              ),
              child: Row(
                mainAxisSize: .min,
                spacing: 8,
                children: [
                  SvgPicture.asset(
                    AppAssets.locationPin,
                    width: 13,
                    height: 13,
                  ),

                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1F2937),
                    ),
                  ),

                  Icon(Icons.expand_more, size: 25, color: Color(0xFFFF6B4A)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: onTapSearch,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 58,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 1, color: const Color(0xFFF3F4F6)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .03),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    SvgPicture.asset(AppAssets.searchIcon, width: 16, height: 16),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        "Search coffee, cakes, donuts...",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: onTapFilter,
                      borderRadius: BorderRadius.circular(999999),
                      child: Container(
                        width: 32,
                        height: 32,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFF5F3),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          AppAssets.filterIcon,
                          width: 12,
                          height: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
