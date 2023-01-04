import 'package:get/get.dart';
import 'package:room_movie/screen/artist/bloc.dart';
import 'package:room_movie/screen/dashboard/bloc.dart';
import 'package:room_movie/screen/home/bloc.dart';
import 'package:room_movie/screen/movie/bloc.dart';
import 'package:room_movie/screen/serial_tv/bloc.dart';
import 'package:room_movie/screen/settings/bloc.dart';

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
