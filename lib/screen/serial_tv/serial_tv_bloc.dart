import 'package:get/get.dart';
import 'package:room_movie/helper/base_function.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/enum/tv_type.dart';
import 'package:room_movie/models/movie/Results.dart';

import '../../service/ApiService.dart';
import '../../util/exception.dart';

class SerialTvBloc extends GetxController {
  var mapsTv = <String, List<Results>>{
    TvType.SEDANG_TAYANG.label: [],
    TvType.TAYANG_DI_TV.label: [],
    TvType.POPULAR.label: [],
    TvType.RATING_TERATAS.label: []
  }.obs;

  var isLoading = true.obs;
  var service = ApiService();
  var listPopular = StaticResults.load.obs;
  var listTopRate = StaticResults.load.obs;
  var listToday = StaticResults.load.obs;
  var listOnTheAir = StaticResults.load.obs;

  void openScreen() {
    (this).getToday();
    (this).getOnTheAir();
    (this).getPopular();
    (this).getTopRate();
  }

  Future<void> getToday() async {
    isLoading(true);
    try {
      var res = await service.getTVToday(1);
      if (res != null && res.results.isNotEmpty) {
        listToday.rxNew(res.results);
        mapsTv['Sedang Tayang'] = listToday;
      }
    } catch (e) {
      if (e is APIException) {
        Get.error(e.message);
      } else {
        Get.error(e.toString());
      }
    }
    isLoading(false);
  }

  Future<void> getOnTheAir() async {
    isLoading(true);
    try {
      var res = await service.getTVOnTheAir(1);
      if (res != null && res.results.isNotEmpty) {
        listOnTheAir.rxNew(res.results);
        mapsTv['Tayang di Tv'] = listOnTheAir;
      }
    } catch (e) {
      if (e is APIException) {
        Get.error(e.message);
      } else {
        Get.error(e.toString());
      }
    }
    isLoading(false);
  }

  Future<void> getPopular() async {
    isLoading(true);
    try {
      var res = await service.getTVPopular(1);
      if (res != null && res.results.isNotEmpty) {
        listPopular.rxNew(res.results);
        mapsTv['Popular'] = listPopular;
      }
    } catch (e) {
      if (e is APIException) {
        Get.error(e.message);
      } else {
        Get.error(e.toString());
      }
    }
    isLoading(false);
  }

  Future<void> getTopRate() async {
    isLoading(true);
    try {
      var res = await service.getTVTopRate(1);
      if (res != null && res.results.isNotEmpty) {
        listTopRate.rxNew(res.results);
        mapsTv['Rating Teratas'] = listTopRate;
      }
    } catch (e) {
      if (e is APIException) {
        Get.error(e.message);
      } else {
        Get.error(e.toString());
      }
    }
    isLoading(false);
  }
}
