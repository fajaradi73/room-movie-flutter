/*
 * room_movie
 *     main.dart
 *     Created by Fajar Adi Prasetyo on 29/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names
import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:room_movie/screen/screen_manager/screen.dart';
import 'package:room_movie/theme/theme_cubit.dart';
import 'package:room_movie/util/dev_tree.dart';
import 'package:sizer/sizer.dart';

import 'helper/binding.dart';
import 'router/app_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  Fimber.plantTree(DevTree());
  // ChuckerFlutter.showOnRelease = true;

  runApp(const App());
  initializeDateFormatting(Get.deviceLocale?.toLanguageTag() ?? "id_ID", '');
}

/// Custom [BlocObserver] that observes all bloc and cubit state changes.
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit && kDebugMode) {
      if (kDebugMode) {
        print(change);
      }
    }
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, device) {
      return LayoutBuilder(builder: (context, constraints) {
        SizerUtil.setScreenSize(constraints, orientation);
        return OrientationBuilder(builder: (context, orientation) {
          return Portal(child: BlocBuilder<ThemeCubit, ThemeData>(
            builder: (_, theme) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Room Movie",
                navigatorKey: Get.key,
                initialRoute: Pages.splashScreen,
                getPages: AppRoute.routes,
                // navigatorObservers: [ChuckerFlutter.navigatorObserver],
                initialBinding: InitialBinding(),
                theme: theme,
                builder: (context, child) {
                  return ScreenManager(
                    child: child ?? const SizedBox(),
                  );
                },
              );
            },
          ));
        });
      });
    });
  }
}
