import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_example/constants/api_endpoints.dart';
import 'package:flutter_bloc_example/model/user_response_model.dart';
import 'package:flutter_bloc_example/utils/network_util.dart';

class HomeScreenRepository {
  Future<List<UserListData>> getUserList(int page) async {
    try {
      List<UserListData> userDataList = [];
      var result = await NetworkUtil.instance.get(
        ApiEndpoints.getUserList,
        queryParameters: {
          "page": page,
        },
      );
      if (result.data != null) {
        UserResponseModel userResponseModel =
            UserResponseModel.fromJson(result.data);
        userDataList.addAll(userResponseModel.data ?? []);
      }
      return userDataList;
    } catch (e) {
      rethrow;
    }
  }
}
