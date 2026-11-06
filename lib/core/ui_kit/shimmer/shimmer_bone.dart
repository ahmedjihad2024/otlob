import 'package:flutter/material.dart';

/// Modular skeleton bone widget inspired by Skeletonizer and dokkan_application.
class ShimmerBone extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final BoxShape shape;
  final Color color;

  const ShimmerBone({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.color = Colors.white,
  });

  const ShimmerBone.square({
    super.key,
    required double size,
    BorderRadius? borderRadius,
    this.color = Colors.white,
  })  : width = size,
        height = size,
        borderRadius = borderRadius ?? const BorderRadius.all(Radius.circular(12)),
        shape = BoxShape.rectangle;

  const ShimmerBone.circle({
    super.key,
    required double size,
    this.color = Colors.white,
  })  : width = size,
        height = size,
        borderRadius = null,
        shape = BoxShape.circle;

  const ShimmerBone.text({
    super.key,
    this.width,
    double fontSize = 14,
    BorderRadius? borderRadius,
    this.color = Colors.white,
  })  : height = fontSize * 0.85,
        borderRadius = borderRadius ?? const BorderRadius.all(Radius.circular(4)),
        shape = BoxShape.rectangle;

  const ShimmerBone.line({
    super.key,
    this.width,
    this.height = 12,
    BorderRadius? borderRadius,
    this.color = Colors.white,
  })  : borderRadius = borderRadius ?? const BorderRadius.all(Radius.circular(6)),
        shape = BoxShape.rectangle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        shape: shape,
        borderRadius: shape == BoxShape.circle ? null : (borderRadius ?? BorderRadius.circular(8)),
      ),
    );
  }
}

