import 'package:get/get.dart';
import 'package:room_movie/screen/artist/artist_bloc.dart';
import 'package:room_movie/screen/home/home_bloc.dart';
import 'package:room_movie/screen/main/dashboard_bloc.dart';
import 'package:room_movie/screen/movie/movie_bloc.dart';
import 'package:room_movie/screen/serialTv/serial_tv_bloc.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardBloc());
    Get.lazyPut(() => HomeBloc());
    Get.lazyPut(() => MovieBloc());
    Get.lazyPut(() => SerialTvBloc());
    Get.lazyPut(() => ArtistBloc());
  }
}
