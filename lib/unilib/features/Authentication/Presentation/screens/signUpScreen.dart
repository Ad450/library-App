import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_project/unilib/core/widgets/widgets/CustomForms.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/screens/EnterOTPScreen.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/state/authentication_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void getOtp(String email, String password) async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      if (mounted) {
        await context
            .watch<AuthenticationCubit>()
            .getVerificationCode(email: email, password: password);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (_, state) => state.maybeMap(
          orElse: () {},
          error: (state) => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error))),
          loading: (state) => CircularProgressIndicator(),
          loaded: (state) => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => EnterOTPScreen()),
              (route) => false)),
      child: SignUpCustomForms(
        passwordController: _passwordController,
        emailController: _emailController,
        formKey: _formKey,
        buttonTitle: "Register",
        title: "Sign Up",
        paddingDecider: double.infinity,
        onTap: ({required String email, required String password}) async =>
            getOtp(email, password),
      ),
    );
  }
}
