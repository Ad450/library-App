import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String _title = "Unilib";
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: UnilibSplashScreen(),
    );
  }
}

class UnilibSplashScreen extends StatelessWidget {
  const UnilibSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}


//  _ongenerateRoutes (RouteSettings _settings){
   
//  }


// class SharedPrefs {
//   bool? _showHomeScreen;
//   String _prefKey = "isVerified";
//   bool? _prefIsVerifiedBool;

//   String get prefKey => _prefKey;
//   bool? get showHomeScreen => _showHomeScreen;

//   bool? get prefIsVerifiedBool => _prefIsVerifiedBool;

//   Future<void> _setShowBookScreenHandler(bool isVerified) async {
//     SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
//     _sharedPrefs.setBool(_prefKey, isVerified);
//   }

//   Future<void> setBookScreen(bool isVerified) async {
//     await _setShowBookScreenHandler(isVerified);
//   }

//   Future<bool> _getHomeScreenHandler() async {
//     SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
//     bool _prefsBool = _sharedPrefs.getBool(_prefKey) ?? false;
//     return _prefsBool;
//   }

//   Future<bool> getHomeScreen() async {
//     bool prefBool = await _getHomeScreenHandler();
//     return prefBool;
//   }
// }
