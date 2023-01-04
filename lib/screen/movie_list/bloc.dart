import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/base_function.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/enum/movie_type.dart';
import 'package:room_movie/screen/dashboard/bloc.dart';

import '../../models/movie/Results.dart';
import '../../service/api_service.dart';
import '../../util/exception.dart';

class MovieListBloc extends GetxController {
  var isLoading = false.obs;
  var pageLoad = false.obs;
  var service = ApiService();
  var list = StaticResults.load.obs;
  var currentPage = 1.obs;
  var scrollController = ScrollController();
  var showButton = false.obs;

  final dashboardBloc = Get.find<DashboardBloc>();

  @override
  void onReady() {
    (this).getMovie(1);
    addScrollListener();
  }

  addScrollListener() {
    scrollController.addListener(() {
      //scroll listener
      double showOffSet = 10.0;

      if (scrollController.offset > showOffSet) {
        showButton.value = true;
      } else {
        showButton.value = false;
      }
      update();
    });
  }

  Future<void> getMovie(int index) async {
    index == 1 ? isLoading(true) : pageLoad(true);
    currentPage.value = index + 1;
    try {
      var res = await fetchAPI(index);
      if (res != null && res.results.isNotEmpty) {
        if (index == 1) {
          list.rxNew(res.results);
        } else {
          list.rxAddAll(res.results);
        }
      }
    } catch (e) {
      currentPage.value = index == 1 ? index : index - 1;
      if (e is APIException) {
        Get.error(e.message);
      } else {
        Get.error(e.toString());
      }
    }
    index == 1 ? isLoading(false) : pageLoad(false);
  }

  fetchAPI(int page) {
    if (dashboardBloc.movieType.value.equal(MovieType.RATING_TERATAS)) {
      return service.getMovieTopRated(page);
    } else if (dashboardBloc.movieType.value.equal(MovieType.SEDANG_TREN)) {
      return service.getMovieTrending(page);
    } else if (dashboardBloc.movieType.value.equal(MovieType.MENDATANG)) {
      return service.getMovieUpcoming(page);
    } else if (dashboardBloc.movieType.value.equal(MovieType.SEDANG_TAYANG)) {
      return service.getMovieNow(page);
    } else {
      return service.getMoviePopular(page);
    }
  }
}
