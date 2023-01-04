/*
 * room_movie
 *     bloc.dart
 *     Created by Fajar Adi Prasetyo on 15/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../helper/restartable_timer.dart';

class AppManager extends GetxController {
  var sessionDuration = const Duration(minutes: 10);

  void reset() => timer.reset();
  late RestartableTimer timer;

  @override
  void onReady() {
    // timer = RestartableTimer.listen(
    //   duration: sessionDuration,
    //   callback: () async {
    //     //IMPLEMENT LOGOUT
    //   },
    //   tick: (tick) => debugPrint(
    //     'SESSION TIME: $tick',
    //   ),
    // );
    //CANCEL AFTER INIT
  }
}
