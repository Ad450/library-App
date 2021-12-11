import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_project/unilib/core/widgets/widgets/CustomForms.dart';
import 'package:library_project/unilib/core/widgets/widgets/retry.dart';

import 'package:library_project/unilib/features/Authentication/Presentation/screens/LoadingScreen.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/state/login/login_bloc.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/state/login/login_events.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/state/login/login_state.dart';
import 'package:library_project/unilib/features/books/presentation/screens/BookScreen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQuery = MediaQuery.of(context);
    var height = _mediaQuery.size.height / 4.5;

    return Scaffold(
      // key: _loginScaffoldKey,
      body: Container(
        child: Consumer<LoginBloc>(
            builder: (_, loginBloc, __) => StreamBuilder<LoginState>(
                  initialData: LoginState.initial(),
                  stream: loginBloc.loginStateStream,
                  builder: (_, AsyncSnapshot<LoginState> snapshot) {
                    return snapshot.data!.when(
                        initial: () => LoginInitial(),
                        loading: () => LoadingScreen(),
                        loaded: () => BookScreen(),
                        error: (message) => Retry(message: message));
                  },
                )),
      ),
    );
  }
}

class LoginInitial extends StatelessWidget {
  const LoginInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomForms(
      buttonTitle: "Login",
      title: "Login",
      paddingDecider: double.infinity,
      onTap: ({required String email, required String password}) {
        assert(
            LoginEvent.payload(email: email, password: password) is LoginEvent);

        Provider.of<LoginBloc>(context, listen: false).loginEventSink.add(
              LoginEvent.payload(email: email, password: password),
            );
      },
    );
  }
}
