import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_project/unilib/core/platform/app_Images.dart';
import 'package:library_project/unilib/core/presentation/unilib_getting_started.dart';
import 'package:library_project/unilib/core/widgets/unilib_base_text.dart';
import 'package:library_project/unilib/core/widgets/unilib_page_wrapper.dart';

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
      home: UnilibHome(),
    );
  }
}

class UnilibHome extends StatelessWidget {
  const UnilibHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: PageView(
            children: <Widget>[
              UnilibSplashScreen(),
              UnilibGettingStartedScreen()
            ],
          ),
        ),
      ),
    );
  }
}

class UnilibSplashScreen extends StatelessWidget {
  const UnilibSplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              
              child: Image.asset(
                AppAssets.logo,
                height: 170,
                width: 150,
                color: Color.alphaBlend(Colors.teal, Colors.deepOrangeAccent),
              ),
            ),
          ],
        ),
      ),
    );
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
