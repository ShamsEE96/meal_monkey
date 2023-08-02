import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meal_monkey/core/enums/connectivity_status.dart';
import 'package:meal_monkey/core/utils/network_utils.dart';

class ConnectivityService {
  StreamController<ConnectivityStatus> connectivityStatusController =
      StreamController<ConnectivityStatus>.broadcast();

  ConnectivityService() {
    final Connectivity connectivity = Connectivity();

    connectivity.onConnectivityChanged.listen((event) {
      connectivityStatusController.add(getStatus(event));
      NetworkUtil.online = getStatus(event) == ConnectivityStatus.ONLINE;
    });
  }

  ConnectivityStatus getStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.bluetooth:
        return ConnectivityStatus.ONLINE;

      case ConnectivityResult.wifi:
        return ConnectivityStatus.ONLINE;

      case ConnectivityResult.ethernet:
        return ConnectivityStatus.ONLINE;

      case ConnectivityResult.mobile:
        return ConnectivityStatus.ONLINE;

      case ConnectivityResult.none:
        return ConnectivityStatus.OFFLINE;

      case ConnectivityResult.vpn:
        return ConnectivityStatus.ONLINE;

      case ConnectivityResult.other:
        return ConnectivityStatus.ONLINE;
    }
  }
}
