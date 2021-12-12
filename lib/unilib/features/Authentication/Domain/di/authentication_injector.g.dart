// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$AuthenticationInjector extends AuthenticationInjector {
  @override
  void _configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<RemoteUserDataSource>(
          (c) => RemoteUserDataSourceImpl(c<NetworkService>()))
      ..registerFactory<LocalUserDataSource>(
          (c) => LocalUserDataSourceImpl(c<Database<dynamic>>()))
      ..registerFactory<UserRepository>((c) => UserRepositoryImpl(
          c<LocalUserDataSource>(), c<RemoteUserDataSource>()))
      ..registerSingleton((c) => CheckLogin(c<UserRepository>()))
      ..registerSingleton((c) => GetVerificationCode(c<UserRepository>()))
      ..registerSingleton((c) => Login(c<UserRepository>()))
      ..registerSingleton((c) => UpdateUser(c<UserRepository>()))
      ..registerSingleton((c) => VerifyCode(c<UserRepository>()))
      ..registerSingleton((c) => Logout(c<UserRepository>()));
  }
}
