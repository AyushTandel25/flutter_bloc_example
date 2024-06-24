import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/model/user_response_model.dart';

abstract class HomeScreenStates extends Equatable {
  const HomeScreenStates();

  @override
  List<Object> get props => [];
}

class FetchUserListInitial extends HomeScreenStates {}

class FetchUserListLoading extends HomeScreenStates {
  final List<UserListData> userListData;

  const FetchUserListLoading(this.userListData);

  @override
  List<Object> get props => [userListData];
}

class FetchUserListLoaded extends HomeScreenStates {
  final List<UserListData> userListData;

  const FetchUserListLoaded(this.userListData);

  @override
  List<Object> get props => [userListData];
}

class FetchUserCompleteList extends HomeScreenStates {
  final List<UserListData> userListData;

  const FetchUserCompleteList(this.userListData);

  @override
  List<Object> get props => [userListData];
}

class FetchUserListError extends HomeScreenStates {
  final List<UserListData> userListData;
  final String error;

  const FetchUserListError(this.error,this.userListData);

  @override
  List<Object> get props => [error,userListData];
}
