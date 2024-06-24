import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/home_screen_bloc/home_screen_event.dart';
import 'package:flutter_bloc_example/bloc/home_screen_bloc/home_screen_states.dart';
import 'package:flutter_bloc_example/model/user_response_model.dart';
import 'package:flutter_bloc_example/repository/home_screen_repository.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenStates> {
  final HomeScreenRepository homeScreenRepository;

  HomeScreenBloc(this.homeScreenRepository) : super(FetchUserListInitial()) {
    on<FetchUserList>((event, emit) async {
      final currentState = state;
      List<UserListData> oldListData = [];
      if (currentState is FetchUserListLoading) {
        oldListData = currentState.userListData;
      }
      if (currentState is FetchUserListLoaded) {
        oldListData = currentState.userListData;
      }
      if (event.pageNumber == 1) {
        oldListData.clear();
      }
      emit(FetchUserListLoading(oldListData));
      try {
        final List<UserListData> userListData =
            await homeScreenRepository.getUserList(event.pageNumber);
        if (userListData.isNotEmpty) {
          emit(FetchUserListLoaded(
              List.from(oldListData)..addAll(userListData)));
        } else {
          emit(FetchUserCompleteList(oldListData));
        }
      } catch (e) {
        emit(FetchUserListError("Something Went Wrong", oldListData));
      }
    });
  }
}
