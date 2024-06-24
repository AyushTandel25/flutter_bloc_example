import 'package:equatable/equatable.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List<Object> get props => [];
}

class FetchUserList extends HomeScreenEvent {
  final int pageNumber;

  const FetchUserList(this.pageNumber);

  @override
  List<Object> get props => [pageNumber];
}
