/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  /// File path: assets/images/film-background.jpg
  AssetGenImage get filmBackground =>
      const AssetGenImage('assets/images/film-background.jpg');

  /// File path: assets/images/film.jpg
  AssetGenImage get film => const AssetGenImage('assets/images/film.jpg');

  /// File path: assets/images/no-image.png
  AssetGenImage get noImage =>
      const AssetGenImage('assets/images/no-image.png');

  /// File path: assets/images/transparent.png
  AssetGenImage get transparent =>
      const AssetGenImage('assets/images/transparent.png');
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/genre_movie.json
  String get genreMovie => 'assets/json/genre_movie.json';

  /// File path: assets/json/genre_tv.json
  String get genreTv => 'assets/json/genre_tv.json';
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/facebook.svg
  SvgGenImage get facebook => const SvgGenImage('assets/svg/facebook.svg');

  /// File path: assets/svg/imdb.svg
  SvgGenImage get imdb => const SvgGenImage('assets/svg/imdb.svg');

  /// File path: assets/svg/instagram.svg
  SvgGenImage get instagram => const SvgGenImage('assets/svg/instagram.svg');

  /// File path: assets/svg/link.svg
  SvgGenImage get link => const SvgGenImage('assets/svg/link.svg');

  /// File path: assets/svg/twitter.svg
  SvgGenImage get twitter => const SvgGenImage('assets/svg/twitter.svg');

  /// File path: assets/svg/wikipedia.svg
  SvgGenImage get wikipedia => const SvgGenImage('assets/svg/wikipedia.svg');
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
  static const $AssetsSvgGen svg = $AssetsSvgGen();
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

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package = 'room_movie',
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
