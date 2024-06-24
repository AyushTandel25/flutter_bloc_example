import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/home_screen_bloc/home_screen_bloc.dart';
import 'package:flutter_bloc_example/bloc/home_screen_bloc/home_screen_event.dart';
import 'package:flutter_bloc_example/bloc/home_screen_bloc/home_screen_states.dart';
import 'package:flutter_bloc_example/model/user_response_model.dart';
import 'package:flutter_bloc_example/repository/home_screen_repository.dart';
import 'package:flutter_bloc_example/utils/connectivity_util.dart';
import 'package:flutter_bloc_example/utils/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenBloc homeScreenBloc;
  bool isFetching = false;
  bool isComplete = false;
  int _currentPage = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    checkConnectivity();
    homeScreenBloc = HomeScreenBloc(HomeScreenRepository());
    homeScreenBloc.add(FetchUserList(_currentPage));
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void checkConnectivity() {
    ConnectivityUtil.instance.onConnectivityChanged
        .listen((ConnectivityResult result) {
      bool isConnected = result != ConnectivityResult.none;
      ConnectivityUtil.showDisconnectedSnackBar(context, isConnected);
    });
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !isFetching &&
        !isComplete) {
      isFetching = true;
      _currentPage++;
      homeScreenBloc.add(FetchUserList(_currentPage));
    }
  }

  void _refreshList() {
    isFetching = false;
    _currentPage = 1;
    homeScreenBloc.add(FetchUserList(_currentPage));
  }


  @override
  void dispose() {
    _scrollController.dispose();
    homeScreenBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeScreenBloc,
      child: Scaffold(
        body: BlocListener<HomeScreenBloc, HomeScreenStates>(
            listener: (context, state) {
          if ((state is FetchUserListLoaded)) {
            isFetching = false;
          } else if ((state is FetchUserCompleteList)) {
            isComplete = false;
          }
        }, child: BlocBuilder<HomeScreenBloc, HomeScreenStates>(
          builder: (context, state) {
            if (state is FetchUserListLoading && state.userListData.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FetchUserListError &&
                state.userListData.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      state.error,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _refreshList();
                      },
                      child: Text(
                        "Refresh",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is! FetchUserListInitial) {
              List<UserListData> userList = [];

              userList = (state is FetchUserListLoaded)
                  ? state.userListData
                  : (state is FetchUserListLoading &&
                          state.userListData.isNotEmpty)
                      ? state.userListData
                      : (state is FetchUserListError &&
                              state.userListData.isNotEmpty)
                          ? state.userListData
                          : (state as FetchUserCompleteList).userListData;

              return RefreshIndicator(
                onRefresh: () async {
                  _refreshList();
                },
                child: ListView.separated(
                  controller: _scrollController,
                  itemCount:
                      userList.length + (state is FetchUserListLoading ? 1 : 0),
                  separatorBuilder: (context, index) {
                    if (index < userList.length) {
                      return SizedBox(
                        height: 30.h,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                  itemBuilder: (context, index) {
                    if (index < userList.length) {
                      String fullName =
                          ("${userList[index].firstName ?? ""} ${userList[index].lastName ?? ""}")
                              .trim();

                      String email = userList[index].email.toString();

                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          children: [
                            ClipOval(
                              child: Utils.getCachedNetworkImage(
                                imageUrl: userList[index].avatar.toString(),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fullName,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  SizedBox(
                                    width: 10.h,
                                  ),
                                  Text(
                                    email,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        )),
      ),
    );
  }
}
