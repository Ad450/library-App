import 'package:flutter/material.dart';
import 'package:library_project/Authentication/auth.dart';
import 'package:library_project/Models/user.dart';
import 'package:library_project/Widgets/CustomForms.dart';

import 'package:library_project/provider/stateProvider.dart';
import 'package:loading_indicator/loading_indicator.dart';

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
    Navigator.pop(context);
  }

  void _handleLogin(
      StateProvider _provider,
      String? _email,
      String? _password,
      TextEditingController _emailController,
      TextEditingController _passwordController) async {
    setState(() {
      _email = _emailController.value.text;
      _password = _passwordController.value.text;
    });
    var _userMap = User().userMap(_email, _password);
    assert(_userMap.isNotEmpty);
    _provider.changeLoginLoading(true);
    print(_provider.isAuthLoading);
    await Auth.login(_userMap, context);
    print("login button working");
    _emailController.clear();
    _passwordController.clear();

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

  Future<void> _showDialog(String _title) {
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
            ));
  }

  Widget _loadingIndicator() {
    return Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        color: Colors.amberAccent,
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<StateProvider>(context);
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    var height = _mediaQuery.size.height / 4.5;
    return _provider.isLoginLoading
        ? _loadingIndicator()
        : CustomForms(
            buttonTitle: "Login",
            title: "Login",
            paddingDecider: 7,
            authHandler: _handleLogin);
  }
}
