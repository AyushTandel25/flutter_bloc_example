import 'package:equatable/equatable.dart';

abstract class SplashScreenEvents extends Equatable {
  const SplashScreenEvents();

  @override
  List<Object> get props => [];
}

class ManageNavigation extends SplashScreenEvents {}