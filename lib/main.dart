import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:library_project/unilib/core/di/configure_dependencies.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/getVerificationCode.dart';
import 'package:library_project/unilib/features/Authentication/Domain/di/authentication_injector.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/login.dart';
import 'package:library_project/unilib/features/onboarding/welcomeScreen.dart';
import 'package:library_project/unilib/features/Authentication/Presentation/state/authentication_cubit.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/logout.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/update_user.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/verify_code.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/check_login.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());

  configureDependencies();
  await Hive.initFlutter();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String _title = "Unilib";
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => AuthenticationCubit(
                  AuthenticationInjector.resolve<GetVerificationCode>(),
                  AuthenticationInjector.resolve<Login>(),
                  AuthenticationInjector.resolve<Logout>(),
                  AuthenticationInjector.resolve<UpdateUser>(),
                  AuthenticationInjector.resolve<VerifyCode>(),
                  AuthenticationInjector.resolve<CheckLogin>(),
                )..checkLogin())
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
            children: <Widget>[
              BlocBuilder<AuthenticationCubit, AuthenticationState>(
                buildWhen: (_, state) {
                  return state.maybeMap(orElse: () => false, loggedOut: (state) => true);
                },
                builder: (_, state) => const WelcomeScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
