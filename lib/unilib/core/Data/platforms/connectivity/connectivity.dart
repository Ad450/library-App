import 'package:connectivity_plus/connectivity_plus.dart';

enum NetworkStatus { mobile, Wifi, off }

class NetWorkConnectivity {
  Future<NetworkStatus> call() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile) {
      return NetworkStatus.mobile;
    } else if (result == ConnectivityResult.wifi) {
      return NetworkStatus.Wifi;
    } else {
      return NetworkStatus.off;
    }
  }
}
