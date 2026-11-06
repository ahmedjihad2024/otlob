import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Reusable Shimmer wrapper matching the aesthetic of top-tier production apps.
class ShimmerLoading extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final Color baseColor;
  final Color highlightColor;
  final Duration duration;

  const ShimmerLoading({
    super.key,
    required this.child,
    this.enabled = true,
    this.baseColor = const Color(0xFFE9EDEE),
    this.highlightColor = const Color(0xFFF7F9FA),
    this.duration = const Duration(milliseconds: 1400),
  });

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      period: duration,
      child: child,
    );
  }
}

