import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class ConnectivityProvider extends ChangeNotifier {
  bool connectionStatus = false;
  Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> subscription;

  bool get getConnectionStatus => false;

  set setConnectionStatus(bool val) {
    connectionStatus = val;
    notifyListeners();
  }

  ConnectivityProvider() {
    subscription = connectivity.onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) {
          setConnectionStatus = true;
          notifyListeners();
        } else if (result == ConnectivityResult.none) {
          setConnectionStatus = false;
          notifyListeners();
        }
      },
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
