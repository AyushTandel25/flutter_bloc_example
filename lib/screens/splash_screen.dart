
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:flutter_bloc_example/bloc/splash_screen_bloc/splash_screen_events.dart';
import 'package:flutter_bloc_example/bloc/splash_screen_bloc/splash_screen_state.dart';
import 'package:flutter_bloc_example/routes/app_routes.dart';
import 'package:flutter_bloc_example/utils/util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenBloc splashScreenBloc = SplashScreenBloc();

  @override
  void initState() {
    super.initState();
    splashScreenBloc.add(ManageNavigation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => splashScreenBloc,
        child: BlocListener<SplashScreenBloc, SplashScreenState>(
          listener: (BuildContext context, SplashScreenState state) {
            if (state is ManageNavigationComplete) {
              AppRoutes.visitHomePage(context);
            } else if (state is ManageNavigationError) {
              Utils.showSnackBar(context, state.error);
            }
          },
          child: Center(
            child: Text(
              "Flutter Bloc Example",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
    );
  }
}
