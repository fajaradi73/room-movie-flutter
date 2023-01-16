// ignore_for_file: file_names, constant_identifier_names
/*
 *     Created by Fajar Adi Prasetyo on 16/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:enum_to_string/enum_to_string.dart';

enum SearchType { ALL, MOVIE, TV, ARTIST, NULL }

extension EnumString on String? {
  SearchType getType() {
    if ((this) != null) {
      var val = (this)?.replaceAll(' ', '_').toUpperCase();
      if (val != null) {
        var enumVal = EnumToString.fromString(SearchType.values, val);
        if (enumVal != null && val.isNotEmpty) {
          return enumVal;
        } else {
          return SearchType.NULL;
        }
      } else {
        return SearchType.NULL;
      }
    } else {
      return SearchType.NULL;
    }
  }
}

extension MovieEx on SearchType? {
  String get noUnderscore {
    if ((this) != null) {
      return (this)!.name.replaceAll('_', ' ');
    } else {
      return '';
    }
  }

  bool equal(SearchType other) {
    if ((this) != null) {
      return ((this) == other);
    } else {
      return false;
    }
  }

  bool unequal(SearchType other) {
    if ((this) != null) {
      return ((this) != other);
    } else {
      return false;
    }
  }

  String get label {
    switch ((this)) {
      case SearchType.ALL:
        return "All";
      case SearchType.MOVIE:
        return "Movie";
      case SearchType.TV:
        return "Tv";
      case SearchType.ARTIST:
        return "Artist";
      default:
        return "";
    }
  }
}
