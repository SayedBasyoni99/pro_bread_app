/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/TeshrinARLTBold.ttf
  String get teshrinARLTBold => 'assets/fonts/TeshrinARLTBold.ttf';

  /// File path: assets/fonts/TeshrinARLTRegular.ttf
  String get teshrinARLTRegular => 'assets/fonts/TeshrinARLTRegular.ttf';

  /// List of all assets
  List<String> get values => [teshrinARLTBold, teshrinARLTRegular];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();

  /// File path: assets/images/png/logInBg.png
  AssetGenImage get logInBg =>
      const AssetGenImage('assets/images/png/logInBg.png');

  /// File path: assets/images/png/onBoardingLogo01.png
  AssetGenImage get onBoardingLogo01 =>
      const AssetGenImage('assets/images/png/onBoardingLogo01.png');

  /// File path: assets/images/png/onBoardingLogo02.png
  AssetGenImage get onBoardingLogo02 =>
      const AssetGenImage('assets/images/png/onBoardingLogo02.png');

  /// File path: assets/images/png/primary_Bg.png
  AssetGenImage get primaryBg =>
      const AssetGenImage('assets/images/png/primary_Bg.png');

  /// File path: assets/images/png/splash_Logo_00.png
  AssetGenImage get splashLogo00 =>
      const AssetGenImage('assets/images/png/splash_Logo_00.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [logInBg, onBoardingLogo01, onBoardingLogo02, primaryBg, splashLogo00];
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  /// File path: assets/images/svg/PBLogo.svg
  String get pBLogo => 'assets/images/svg/PBLogo.svg';

  /// File path: assets/images/svg/buttomSheet.svg
  String get buttomSheet => 'assets/images/svg/buttomSheet.svg';

  /// File path: assets/images/svg/phone_icon.svg
  String get phoneIcon => 'assets/images/svg/phone_icon.svg';

  /// File path: assets/images/svg/splash_Logo_0.svg
  String get splashLogo0 => 'assets/images/svg/splash_Logo_0.svg';

  /// List of all assets
  List<String> get values => [pBLogo, buttomSheet, phoneIcon, splashLogo0];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
