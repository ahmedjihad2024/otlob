import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomizedSmartRefresh extends StatelessWidget {
  final Widget child;
  final RefreshController controller;
  final ScrollController? scrollController;
  final void Function()? onLoading;
  final void Function()? onRefresh;
  final bool enableLoading;
  final bool enableRefresh;
  final EdgeInsetsGeometry? classicFooterPadding;
  final ScrollPhysics? physics;

  const CustomizedSmartRefresh({
    super.key,
    required this.child,
    required this.controller,
    this.scrollController,
    this.onLoading,
    this.onRefresh,
    this.enableLoading = false,
    this.enableRefresh = true,
    this.classicFooterPadding,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFF5C39);

    return SmartRefresher(
      controller: controller,
      scrollController: scrollController,
      enablePullUp: enableLoading,
      enablePullDown: enableRefresh,
      physics: physics,
      header: const ClassicHeader(
        idleIcon: Icon(Icons.arrow_downward, color: primaryColor),
        releaseIcon: Icon(Icons.refresh, color: primaryColor),
        refreshingIcon: SizedBox(
          width: 25.0,
          height: 50.0,
          child: Center(
            child: SizedBox(
              width: 25.0,
              height: 25.0,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              ),
            ),
          ),
        ),
        idleText: '',
        refreshingText: '',
        completeText: '',
        failedText: '',
        releaseText: '',
        canTwoLevelText: '',
        textStyle: TextStyle(fontSize: 0, height: 0),
      ),
      footer: ClassicFooter(
        outerBuilder: (child) {
          return Padding(
            padding: classicFooterPadding ?? EdgeInsets.zero,
            child: child,
          );
        },
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0x80111827),
        ),
        loadingText: 'Loading...',
        noDataText: 'No more data',
        failedText: 'Failed to load',
        idleText: 'Load more',
        canLoadingText: 'Load more',
        spacing: 12.0,
        height: 50 + (classicFooterPadding?.vertical ?? 0),
        loadingIcon: const SizedBox(
          width: 15.0,
          height: 15.0,
          child: CircularProgressIndicator(
            color: primaryColor,
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            backgroundColor: Colors.transparent,
            strokeWidth: 2.2,
            strokeCap: StrokeCap.round,
          ),
        ),
      ),
      onLoading: onLoading,
      onRefresh: onRefresh != null
          ? () {
              HapticFeedback.mediumImpact();
              onRefresh!();
            }
          : null,
      child: child,
    );
  }
}
