import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_project/unilib/core/custom_widgets/CustomForms.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/screens/EnterOTPScreen.dart';
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

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  void getOtp() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      if (mounted) {
        setState(() {
          _loading = !_loading;
        });

        await BlocProvider.of<AuthenticationCubit>(context, listen: false).getVerificationCode(
          email: _emailController.value.text,
          password: _passwordController.value.text,
        );
      }
    } else {
      _emailFocus.requestFocus();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    _emailFocus.dispose();
    _passwordFocus.dispose();
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
        error: (state) {
          setState(() {
            _loading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(state.error),
                  TextButton(
                    onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                    child: const Text("OK", style: TextStyle(color: Colors.amberAccent, fontSize: 15)),
                  )
                ],
              ),
            ),
          );
        },
        loading: (state) {
          if (mounted)
            setState(() {
              _loading = true;
            });
        },
        loaded: (state) {
          setState(() {
            _loading = false;
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => const EnterOtpScreen(),
              ),
              (route) => false);
        },
      ),
      child: SignUpCustomForms(
        passwordController: _passwordController,
        emailController: _emailController,
        emailFocus: _emailFocus,
        passwordFocus: _passwordFocus,
        formKey: _formKey,
        buttonTitle: "Register",
        loading: _loading,
        title: "Sign Up",
        paddingDecider: double.infinity,
        onTap: () async => getOtp(),
      ),
    );
  }
}
