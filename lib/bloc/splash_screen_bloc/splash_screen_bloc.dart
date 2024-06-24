import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/splash_screen_bloc/splash_screen_events.dart';
import 'package:flutter_bloc_example/bloc/splash_screen_bloc/splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvents, SplashScreenState> {
  SplashScreenBloc() : super(ManageNavigationInitialize()) {
    on<SplashScreenEvents>((event, emit) async {
      if (event is ManageNavigation) {
        try {
          emit(ManageNavigationStart());
          await Future.delayed(const Duration(seconds: 2), () {
            emit(ManageNavigationComplete());
          });
        } catch (e){
          emit(const ManageNavigationError("Something Went Wrong"));
        }
      }
    });
  }
}
