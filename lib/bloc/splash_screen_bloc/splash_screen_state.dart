import 'package:equatable/equatable.dart';

abstract class SplashScreenState extends Equatable {
  const SplashScreenState();

  @override
  List<Object> get props => [];
}

class ManageNavigationInitialize extends SplashScreenState {}
class ManageNavigationStart extends SplashScreenState {}
class ManageNavigationComplete extends SplashScreenState {}
class ManageNavigationError extends SplashScreenState {

  final String error;

  const ManageNavigationError(this.error);

  @override
  List<Object> get props => [error];
}