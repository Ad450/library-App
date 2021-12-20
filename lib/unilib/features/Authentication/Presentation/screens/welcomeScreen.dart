import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_project/main.dart';
import 'package:library_project/unilib/core/utils/assets/app_Images.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/state/authentication_cubit.dart';

import 'landingScreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen();
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _mediaHeight = MediaQuery.of(context).size.height;
    final _mediaWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (_, state) => state.maybeMap(
          orElse: () {},
          loggedIn: (state) => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => UnilibHome(),
            ),
            (route) => false,
          ),
          loggedOut: (state) {
            if (state.user == null) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const WelcomeScreen()),
                (route) => false,
              );
            }
          },
          error: (state) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          ),
        ),
        child: PageView(children: [
          Scaffold(
            body: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.amberAccent),
                ),
                Positioned(
                  top: _mediaHeight * 0.4,
                  left: _mediaWidth * 0.2,
                  right: _mediaWidth * 0.2,
                  bottom: _mediaHeight * 0.4,
                  child: CustomLogo(),
                ),
              ],
            ),
          ),
          LandingScreen()
        ]),
      ),
    );
  }
}

class CustomLogo extends StatelessWidget {
  const CustomLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset(AppAssets.logo),
      ),
    );
  }
}
