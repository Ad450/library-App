import 'package:flutter/material.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/login/login_bloc.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/otp/otp_bloc.dart';



import 'package:library_project/unilib/features/Authentication/Presentation/screens/welcomeScreen.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/signup/signup_bloc.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/verification/verification_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final  SignUpBloc signUpBloc = SignUpBloc();
  final VerificationBloc verificationBloc = VerificationBloc();
  final  OTPBloc otpBloc = OTPBloc();
  final LoginBloc loginBloc = LoginBloc();
  final String _title = "Unilib";
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        
         Provider.value(value: signUpBloc),
         Provider.value(value: verificationBloc),
         Provider.value(value: otpBloc),
         Provider.value(value: loginBloc)
        ],
      child: MaterialApp(
        title: _title,
        home: UnilibHome(),
      ),
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
            children: <Widget>[WelcomeScreen()],
          ),
        ),
      ),
    );
  }
}

// class UnilibSplashScreen extends StatelessWidget {
//   const UnilibSplashScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       decoration: BoxDecoration(color: Colors.blue.shade900),
//       child: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               child: Image.asset(
//                 AppAssets.logo,
//                 height: 170,
//                 width: 150,
//                 color: Color.alphaBlend(Colors.white, Colors.blue.shade900),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


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
