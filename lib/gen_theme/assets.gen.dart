/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************
import 'package:flutter/widgets.dart';

class $AssetsHtmlGen {
  const $AssetsHtmlGen();

  $AssetsHtmlDarkGen get dark => const $AssetsHtmlDarkGen();
  $AssetsHtmlLightGen get light => const $AssetsHtmlLightGen();
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_tmdb.png
  AssetGenImage get icTmdb => const AssetGenImage('assets/icons/ic_tmdb.png');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background.jpg
  AssetGenImage get background =>
      const AssetGenImage('assets/images/background.jpg');
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/genre_movie.json
  String get genreMovie => 'assets/json/genre_movie.json';

  /// File path: assets/json/genre_tv.json
  String get genreTv => 'assets/json/genre_tv.json';
}

class $AssetsHtmlDarkGen {
  const $AssetsHtmlDarkGen();

  /// File path: assets/html/dark/contribution_dark.html
  String get contributionDark => 'assets/html/dark/contribution_dark.html';

  /// File path: assets/html/dark/privacy_policy_dark.html
  String get privacyPolicyDark => 'assets/html/dark/privacy_policy_dark.html';

  /// File path: assets/html/dark/term_of_use_dark.html
  String get termOfUseDark => 'assets/html/dark/term_of_use_dark.html';
}

class $AssetsHtmlLightGen {
  const $AssetsHtmlLightGen();

  /// File path: assets/html/light/contribution.html
  String get contribution => 'assets/html/light/contribution.html';

  /// File path: assets/html/light/privacy_policy.html
  String get privacyPolicy => 'assets/html/light/privacy_policy.html';

  /// File path: assets/html/light/term_of_use.html
  String get termOfUse => 'assets/html/light/term_of_use.html';
}

class Assets {
  Assets._();

  static const $AssetsHtmlGen html = $AssetsHtmlGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
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
    String? package = 'room_movie',
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
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/room_movie/$_assetName';
}
