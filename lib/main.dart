import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/constants/app_constants.dart';
import 'package:flutter_bloc_example/constants/route_constants.dart';
import 'package:flutter_bloc_example/firebase_options.dart';
import 'package:flutter_bloc_example/routes/app_routes.dart';
import 'package:flutter_bloc_example/utils/network_util.dart';
import 'package:flutter_bloc_example/utils/shared_pref_util.dart';
import 'package:flutter_bloc_example/utils/theme_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Set default error handling to Crashlytics
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    // shared preference util class instance assigned for whole cycle
    await SharedPrefUtil.instance.initializeSharedPreference();

    // network util class instance assigned for whole cycle
    NetworkUtil.instance.initialize();

    // firebase crashlytics initialization
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    runApp(const MyApp());
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          title: AppConstants.appName,
          theme: MyAppTheme.lightTheme,
          darkTheme: MyAppTheme.darkTheme,
          themeMode: ThemeMode.system,
          onGenerateRoute: AppRoutes.generateRoute,
          initialRoute: RouteConstants.splashScreenRoute,
        );
      },
    );
  }
}
