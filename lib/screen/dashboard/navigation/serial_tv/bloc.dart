import 'package:get/get.dart';
import 'package:room_movie/helper/base_function.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/enum/tv_type.dart';
import 'package:room_movie/models/movie/Results.dart';
import 'package:room_movie/service/api_service.dart';
import 'package:room_movie/util/exception.dart';

class SerialTvBloc extends GetxController {
  var mapsTv = <String, List<Results>>{
    TvType.SEDANG_TAYANG.label: StaticResults.newData.obs,
    TvType.TAYANG_DI_TV.label: StaticResults.newData.obs,
    TvType.POPULAR.label: StaticResults.newData.obs,
    TvType.RATING_TERATAS.label: StaticResults.newData.obs
  }.obs;

  var isLoading = true.obs;
  var service = ApiService();
  var listPopular = StaticResults.newData.obs;
  var listTopRate = StaticResults.newData.obs;
  var listToday = StaticResults.newData.obs;
  var listOnTheAir = StaticResults.newData.obs;
  var isFirstOpen = true;

  void openScreen() {
    if (isFirstOpen) {
      (this).getToday();
      isFirstOpen = false;
    }
  }

  Future<void> getToday() async {
    isLoading(true);
    try {
      var res = await service.getTVToday(1);
      if (res != null && res.results.isNotEmpty) {
        listToday.rxNew(res.results);
        mapsTv['Sedang Tayang'] = listToday;
        (this).getOnTheAir();
      }
    } catch (e) {
      if (e is APIException) {
        Get.error(e.message);
      } else {
        Get.error(e.toString());
      }
      isLoading(false);
    }
  }

  Future<void> getOnTheAir() async {
    isLoading(true);
    try {
      var res = await service.getTVOnTheAir(1);
      if (res != null && res.results.isNotEmpty) {
        listOnTheAir.rxNew(res.results);
        mapsTv['Tayang di Tv'] = listOnTheAir;
        (this).getPopular();
      }
    } catch (e) {
      if (e is APIException) {
        Get.error(e.message);
      } else {
        Get.error(e.toString());
      }
      isLoading(false);
    }
  }

  Future<void> getPopular() async {
    isLoading(true);
    try {
      var res = await service.getTVPopular(1);
      if (res != null && res.results.isNotEmpty) {
        listPopular.rxNew(res.results);
        mapsTv['Popular'] = listPopular;
        (this).getTopRate();
      }
    } catch (e) {
      if (e is APIException) {
        Get.error(e.message);
      } else {
        Get.error(e.toString());
      }
      isLoading(false);
    }
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
