/// Created by Fajar Adi Prasetyo on 20/12/2022.
import 'package:enum_to_string/enum_to_string.dart';

enum MovieType {
  POPULAR,
  RATING_TERATAS,
  SEDANG_TAYANG,
  MENDATANG,
  SEDANG_TREN,
  NULL
}

extension EnumString on String? {
  MovieType getType() {
    if ((this) != null) {
      var val = (this)?.replaceAll(' ', '_').toUpperCase();
      var enumVal = EnumToString.fromString(MovieType.values, val!);
      if (enumVal != null && val.isNotEmpty) {
        return enumVal;
      } else {
        return MovieType.NULL;
      }
    } else {
      return MovieType.NULL;
    }
  }
}

extension MovieEx on MovieType? {
  String get noUnderscore {
    if ((this) != null) {
      return (this)!.name.replaceAll('_', ' ');
    } else {
      return '';
    }
  }

  bool equal(MovieType other) {
    if ((this) != null) {
      return ((this) == other);
    } else {
      return false;
    }
  }

  bool unequal(MovieType other) {
    if ((this) != null) {
      return ((this) != other);
    } else {
      return false;
    }
  }

  String get label {
    switch ((this)) {
      case MovieType.POPULAR:
        return "Popular";
      case MovieType.RATING_TERATAS:
        return "Rating Teratas";
      case MovieType.SEDANG_TREN:
        return "Sedang Tren";
      case MovieType.SEDANG_TAYANG:
        return "Sedang Tayang";
      case MovieType.MENDATANG:
        return "Mendatang";
      default:
        return "";
    }
  }
}
