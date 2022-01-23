// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$AccountInjector extends AccountInjector {
  @override
  void _configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<AccountRepository>((c) => AccountRepositoryImpl());
  }
}
