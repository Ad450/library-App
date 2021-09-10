import 'package:flutter/material.dart';
import 'package:library_project/Authentication/auth.dart';
import 'package:library_project/Models/user.dart';
import 'package:library_project/UI/LoadingScreen.dart';
import 'package:library_project/Widgets/CustomForms.dart';
import 'package:library_project/provider/stateProvider.dart';
import 'package:provider/provider.dart';

import 'GiveDetailScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String loginScreenUrl = "/SignUpScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _closeDialog() {
    //Navigator.pop(context);
  }

  void _handleLogin(
    StateProvider _provider,
    String? _email,
    String? _password,
    TextEditingController _emailController,
    TextEditingController _passwordController,
  ) async {
    setState(() {
      _email = _emailController.value.text;
      _password = _passwordController.value.text;
    });
    var _userMap = User().userMap(_email, _password);
    //assert(_userMap.isNotEmpty);
    _provider.changeLoginLoading(true);
    if (mounted) {
      print("auth has started");
      await Auth.login(_userMap, context);
    } else {
      _emailController.clear();
      _passwordController.clear();
    }

    print("login button working");

    if (_provider.isLoggedIn) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GiveDetailsScreen(),
        ),
      );
    } else if (_provider.loginMessage != null) {
      _showDialog(_provider.loginMessage!);
    }
  }

  Future<void> _showDialog(
    String _title,
  ) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(_title),
        content: Text("please try again"),
        actions: <Widget>[
          TextButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.indigo.shade900),
            ),
            onPressed: _closeDialog,
          )
        ],
      ),
    );
  }

  Widget _loadingIndicator() {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(maxHeight: double.infinity),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.amberAccent,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _closeDialog();
    print("login screen dispose method called");
    //  Navigator.pop(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<StateProvider>(context);
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    var height = _mediaQuery.size.height / 4.5;

    if (!mounted) {
      return CustomForms(
        buttonTitle: "Login",
        title: "Login",
        paddingDecider: 7,
        authHandler: _handleLogin,
      );
    }

    return Scaffold(
      // key: _loginScaffoldKey,
      body: _provider.isLoginLoading
          ? LoadingScreen(
              authTitle: "please wait while we log you in!",
            )
          : CustomForms(
              buttonTitle: "Login",
              title: "Login",
              paddingDecider: 7,
              authHandler: _handleLogin,
            ),
    );
  }
}
