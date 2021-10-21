

enum NetworkStatus { mobile, Wifi, off }

abstract class NetworkInfo {
  Future<NetworkStatus> call();
}
