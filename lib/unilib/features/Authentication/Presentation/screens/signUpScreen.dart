import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_project/unilib/core/widgets/widgets/CustomForms.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/screens/EnterOTPScreen.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/screens/LoadingScreen.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/state/authentication_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _loading = false;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void getOtp(String email, String password) async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      if (mounted) {
        setState(() {
          _loading = !_loading;
        });

        await BlocProvider.of<AuthenticationCubit>(context, listen: false)
            .getVerificationCode(email: email, password: password);
      }
    } else {
      FocusScope.of(context).requestFocus();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (_, state) => state.maybeMap(
          orElse: () {
            if (mounted)
              setState(() {
                _loading = false;
              });
          },
          error: (state) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(state.error),
                  TextButton(
                    onPressed: () =>
                        ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                    child: Text(
                      "OK",
                      style: TextStyle(color: Colors.amberAccent, fontSize: 15),
                    ),
                  )
                ],
              ))),
          loading: (state) {
            if (mounted)
              setState(() {
                _loading = true;
              });
            return ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("loading...")));
          },
          loaded: (state) => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => EnterOTPScreen()),
              (route) => false)),
      child: SignUpCustomForms(
        passwordController: _passwordController,
        emailController: _emailController,
        formKey: _formKey,
        buttonTitle: "Register",
        loading: _loading,
        title: "Sign Up",
        paddingDecider: double.infinity,
        onTap: ({required String email, required String password}) async =>
            getOtp(email, password),
      ),
    );
  }
}
