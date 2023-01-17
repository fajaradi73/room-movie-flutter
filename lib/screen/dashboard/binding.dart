import 'package:get/get.dart';
import 'package:room_movie/screen/settings/bloc.dart';

import 'bloc.dart';
import 'navigation/artist/bloc.dart';
import 'navigation/home/bloc.dart';
import 'navigation/movie/bloc.dart';
import 'navigation/serial_tv/bloc.dart';

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
