// checking connectivity of platform

import 'dart:async';
import 'dart:io';
import 'package:library_project/unilib/core/failures.dart';
import 'package:rxdart/rxdart.dart';

class InternetConnectivity {
  // create a singleton of class
  InternetConnectivity._();

  // currentConnection
  bool isConnected = false;

  factory InternetConnectivity.instance() => InternetConnectivity._();

// set up a stream [broadcast] or behavior subject that takes connection status

  StreamController<bool> _connectivityController = BehaviorSubject<bool>();

  Stream<bool> get _connectivityStream => _connectivityController.stream;

  StreamSink<bool> get _connectivitySink => _connectivityController.sink;

// listen to stream at point of creating the internetConnectivity object which is a singleton

  Stream<bool> get onConnectivityChange => _connectivityStream;

  init() {
    onConnectivityChange.listen((result) async {
      if (!result) throw NoInternetFailure("no internet connection");
    });

    _checkInternetConnectivity();
  }

// check if platform is connected to the internet by address lookup

  Future<bool> _checkInternetConnectivity() async {
    // get previous Connection Status
    bool previouslyConnected = isConnected;

    final addresses = await InternetAddress.lookup("example.com");
    if (addresses.isNotEmpty && addresses[0].rawAddress.isNotEmpty) {
      isConnected = true;

      // should not add if the connection status is the same as previous
      if (previouslyConnected != isConnected) {
        _connectivitySink.add(isConnected);
      }
    }

    return isConnected;
  }

// close all instances of streamController

  void dispose() {
    _connectivityController.close();
  }
}
