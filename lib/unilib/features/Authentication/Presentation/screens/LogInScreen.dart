import 'package:flutter/material.dart';
import 'package:library_project/unilib/core/widgets/widgets/CustomForms.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // MediaQueryData _mediaQuery = MediaQuery.of(context);
    //var height = _mediaQuery.size.height / 4.5;

    return Scaffold(
        body: SignUpCustomForms(
      emailController: _emailController,
      formKey: _formKey,
      passwordController: _passwordController,
      buttonTitle: "Login",
      title: "Login",
      paddingDecider: double.infinity,
      onTap: ({required String email, required String password}) {},
    ));
  }
}
