import 'package:flutter/material.dart';
import 'package:library_project/SharedPrefs.dart';

import 'package:library_project/UI/ForgotPassword.dart';
import 'package:library_project/provider/stateProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UI/GiveDetailScreen.dart';
import 'UI/landingScreen.dart';
import 'UI/LoginScreen.dart';
import 'UI/verification.dart';
import 'UI/welcomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool prefBool = await SharedPrefs().getHomeScreen();

  runApp(MyApp(prefBool));
}

class MyApp extends StatelessWidget {
  final _title = "Uenr library";
  final bool prefBool;
  MyApp(this.prefBool);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StateProvider(),
      child: MaterialApp(
        routes: {
          LoginScreen.loginScreenUrl: (context) => LoginScreen(),
          VerificationScreen.verificationScreenRoute: (context) =>
              VerificationScreen(),
          GiveDetailsScreen.detailsUrl: (context) => GiveDetailsScreen(),
          ForgotPasswordScreen.forgotPasswordUrl: (context) =>
              ForgotPasswordScreen()
        },
        title: _title,
        home: WelcomeScreen(prefBool),
      ),
    );
  }
}


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
