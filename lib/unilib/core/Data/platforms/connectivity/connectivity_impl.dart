import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:library_project/unilib/core/Data/platforms/connectivity/connectivity_contract.dart';



class NetWorkConnectivity implements NetworkInfo {
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
