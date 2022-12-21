// ignore_for_file: file_names, constant_identifier_names
/*
 * 
 *     tv_type
 *     Created by Fajar Adi Prasetyo on 21/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:enum_to_string/enum_to_string.dart';

enum TvType { POPULAR, RATING_TERATAS, SEDANG_TAYANG, TAYANG_DI_TV, NULL }

extension EnumString on String? {
  TvType getType() {
    if ((this) != null) {
      var val = (this)?.replaceAll(' ', '_').toUpperCase();
      var enumVal = EnumToString.fromString(TvType.values, val!);
      if (enumVal != null && val.isNotEmpty) {
        return enumVal;
      } else {
        return TvType.NULL;
      }
    } else {
      return TvType.NULL;
    }
  }
}

extension MovieEx on TvType? {
  String get noUnderscore {
    if ((this) != null) {
      return (this)!.name.replaceAll('_', ' ');
    } else {
      return '';
    }
  }

  bool equal(TvType other) {
    if ((this) != null) {
      return ((this) == other);
    } else {
      return false;
    }
  }

  bool unequal(TvType other) {
    if ((this) != null) {
      return ((this) != other);
    } else {
      return false;
    }
  }

  String get label {
    switch ((this)) {
      case TvType.POPULAR:
        return "Popular";
      case TvType.RATING_TERATAS:
        return "Rating Teratas";
      case TvType.TAYANG_DI_TV:
        return "Tayang di Tv";
      case TvType.SEDANG_TAYANG:
        return "Sedang Tayang";
      default:
        return "";
    }
  }
}
