import 'package:library_project/unilib/core/di/core_injector.dart';
import 'package:library_project/unilib/features/Authentication/Domain/di/authentication_injector.dart';

void configureDependencies() {
  coreInjector().setUp();
  authenticationInjector().setUp();
}
