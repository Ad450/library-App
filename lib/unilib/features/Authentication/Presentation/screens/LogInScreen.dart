import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_project/unilib/core/custom_widgets/CustomForms.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/state/authentication_cubit.dart';
import 'package:library_project/unilib/features/books/presentation/screens/BookScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  bool _loading = false;

  void _performLogin() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      if (mounted) {
        setState(() {
          _loading = true;
        });
      }

      await context.read<AuthenticationCubit>().login(
            _emailController.value.text.trim(),
            _passwordController.value.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    // MediaQueryData _mediaQuery = MediaQuery.of(context);
    //var height = _mediaQuery.size.height / 4.5;

    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (_, state) => state.maybeMap(
          orElse: () {},
          loading: (state) {
            setState(() {
              _loading = true;
            });
          },
          error: (state) {
            if (mounted) {
              setState(() {
                _loading = false;
              });
            }

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
          loaded: (state) {
            if (mounted) {
              setState(() {
                _loading = false;
              });
            }

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => BookScreen()),
              (route) => false,
            );
          }),
      child: Scaffold(
          body: SignUpCustomForms(
              emailController: _emailController,
              emailFocus: _emailFocus,
              passwordFocus: _passwordFocus,
              formKey: _formKey,
              passwordController: _passwordController,
              buttonTitle: "Login",
              title: "Login",
              paddingDecider: double.infinity,
              loading: _loading,
              onTap: () async => _performLogin())),
    );
  }
}
