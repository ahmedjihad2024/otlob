// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:lottie/lottie.dart' as _lottie;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/blueberry_cheesecake.png
  AssetGenImage get blueberryCheesecake =>
      const AssetGenImage('assets/images/blueberry_cheesecake.png');

  /// File path: assets/images/dark_chocolate_mocha.png
  AssetGenImage get darkChocolateMocha =>
      const AssetGenImage('assets/images/dark_chocolate_mocha.png');

  /// File path: assets/images/double_caramel_frappuccino.png
  AssetGenImage get doubleCaramelFrappuccino =>
      const AssetGenImage('assets/images/double_caramel_frappuccino.png');

  /// File path: assets/images/glazed_donuts.png
  AssetGenImage get glazedDonuts =>
      const AssetGenImage('assets/images/glazed_donuts.png');

  /// File path: assets/images/vanilla_latte.png
  AssetGenImage get vanillaLatte =>
      const AssetGenImage('assets/images/vanilla_latte.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    blueberryCheesecake,
    darkChocolateMocha,
    doubleCaramelFrappuccino,
    glazedDonuts,
    vanillaLatte,
  ];
}

class $AssetsLottieAnimationsGen {
  const $AssetsLottieAnimationsGen();

  /// File path: assets/lottie_animations/empty.json
  LottieGenImage get empty =>
      const LottieGenImage('assets/lottie_animations/empty.json');

  /// File path: assets/lottie_animations/error.json
  LottieGenImage get error =>
      const LottieGenImage('assets/lottie_animations/error.json');

  /// File path: assets/lottie_animations/globe.json
  LottieGenImage get globe =>
      const LottieGenImage('assets/lottie_animations/globe.json');

  /// File path: assets/lottie_animations/sandy-loading.json
  LottieGenImage get sandyLoading =>
      const LottieGenImage('assets/lottie_animations/sandy-loading.json');

  /// File path: assets/lottie_animations/succesfull.json
  LottieGenImage get succesfull =>
      const LottieGenImage('assets/lottie_animations/succesfull.json');

  /// List of all assets
  List<LottieGenImage> get values => [
    empty,
    error,
    globe,
    sandyLoading,
    succesfull,
  ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/app-logo.svg
  SvgGenImage get appLogo => const SvgGenImage('assets/svg/app-logo.svg');

  /// File path: assets/svg/bell_icon.svg
  SvgGenImage get bellIcon => const SvgGenImage('assets/svg/bell_icon.svg');

  /// File path: assets/svg/chevron_down.svg
  SvgGenImage get chevronDown =>
      const SvgGenImage('assets/svg/chevron_down.svg');

  /// File path: assets/svg/eye_fill.svg
  SvgGenImage get eyeFill => const SvgGenImage('assets/svg/eye_fill.svg');

  /// File path: assets/svg/filter_border_icon.svg
  SvgGenImage get filterBorderIcon =>
      const SvgGenImage('assets/svg/filter_border_icon.svg');

  /// File path: assets/svg/filter_icon.svg
  SvgGenImage get filterIcon => const SvgGenImage('assets/svg/filter_icon.svg');

  /// File path: assets/svg/github.svg
  SvgGenImage get github => const SvgGenImage('assets/svg/github.svg');

  /// File path: assets/svg/gitlab.svg
  SvgGenImage get gitlab => const SvgGenImage('assets/svg/gitlab.svg');

  /// File path: assets/svg/heart_icon.svg
  SvgGenImage get heartIcon => const SvgGenImage('assets/svg/heart_icon.svg');

  /// File path: assets/svg/location.svg
  SvgGenImage get location => const SvgGenImage('assets/svg/location.svg');

  /// File path: assets/svg/location_pin.svg
  SvgGenImage get locationPin =>
      const SvgGenImage('assets/svg/location_pin.svg');

  /// File path: assets/svg/nav_cart.svg
  SvgGenImage get navCart => const SvgGenImage('assets/svg/nav_cart.svg');

  /// File path: assets/svg/nav_explore.svg
  SvgGenImage get navExplore => const SvgGenImage('assets/svg/nav_explore.svg');

  /// File path: assets/svg/nav_home.svg
  SvgGenImage get navHome => const SvgGenImage('assets/svg/nav_home.svg');

  /// File path: assets/svg/nav_orders.svg
  SvgGenImage get navOrders => const SvgGenImage('assets/svg/nav_orders.svg');

  /// File path: assets/svg/nav_profile.svg
  SvgGenImage get navProfile => const SvgGenImage('assets/svg/nav_profile.svg');

  /// File path: assets/svg/search_icon.svg
  SvgGenImage get searchIcon => const SvgGenImage('assets/svg/search_icon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    appLogo,
    bellIcon,
    chevronDown,
    eyeFill,
    filterBorderIcon,
    filterIcon,
    github,
    gitlab,
    heartIcon,
    location,
    locationPin,
    navCart,
    navExplore,
    navHome,
    navOrders,
    navProfile,
    searchIcon,
  ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/ar.json
  String get ar => 'assets/translations/ar.json';

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// List of all assets
  List<String> get values => [ar, en];
}

abstract final class Assets {
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieAnimationsGen lottieAnimations =
      $AssetsLottieAnimationsGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName, {this.flavors = const {}});

  final String _assetName;
  final Set<String> flavors;

  _lottie.LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    _lottie.FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    _lottie.LottieDelegates? delegates,
    _lottie.LottieOptions? options,
    void Function(_lottie.LottieComposition)? onLoaded,
    _lottie.LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, _lottie.LottieComposition?)?
    frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
    _lottie.LottieDecoder? decoder,
    _lottie.RenderCache? renderCache,
    bool? backgroundLoading,
  }) {
    return _lottie.Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
      decoder: decoder,
      renderCache: renderCache,
      backgroundLoading: backgroundLoading,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
