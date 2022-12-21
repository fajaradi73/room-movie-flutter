import 'package:get/get.dart';
import 'package:room_movie/screen/artist/artist_bloc.dart';
import 'package:room_movie/screen/dashboard/dashboard_bloc.dart';
import 'package:room_movie/screen/home/home_bloc.dart';
import 'package:room_movie/screen/movie/movie_bloc.dart';
import 'package:room_movie/screen/serial_tv/serial_tv_bloc.dart';
import 'package:room_movie/screen/settings/settings_bloc.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardBloc());
    Get.lazyPut(() => HomeBloc());
    Get.lazyPut(() => MovieBloc());
    Get.lazyPut(() => SerialTvBloc());
    Get.lazyPut(() => ArtistBloc());
    Get.lazyPut(() => SettingsBloc());
  }
}
