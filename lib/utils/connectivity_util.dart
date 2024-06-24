import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/utils/util.dart';

class ConnectivityUtil {
  ConnectivityUtil._privateConstructor();

  static final ConnectivityUtil instance =
      ConnectivityUtil._privateConstructor();
  bool? _wasConnected;

  bool? get wasConnected => _wasConnected;

  Future<bool> isOnline() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  Stream<ConnectivityResult> get onConnectivityChanged =>
      Connectivity().onConnectivityChanged;

  static showDisconnectedSnackBar(BuildContext context, bool isConnected) {
    ConnectivityUtil.instance._wasConnected = isConnected;

    if (!isConnected) {
      Utils.showSnackBar(context, "No Internet Connection");
    }
  }
}
