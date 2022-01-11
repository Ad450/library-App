import 'package:kiwi/kiwi.dart';
import 'package:library_project/unilib/core/data/database/database_service.dart';
import 'package:library_project/unilib/core/data/network/network_service.dart';
import 'package:library_project/unilib/features/Authentication/Data/DataSources/local_data_source.dart';
import 'package:library_project/unilib/features/Authentication/Data/DataSources/remote_data_source.dart';
import 'package:library_project/unilib/features/Authentication/Data/repository/user_repositoryImpl.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/check_login.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/get_verification_code.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/login.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/logout.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/update_user.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/verify_code.dart';

part 'authentication_injector.g.dart';

abstract class AuthenticationInjector {
  static late KiwiContainer container;
  static final resolve = container.resolve;

  void setUp() {
    container = KiwiContainer();

    _$AuthenticationInjector()._configure();
  }

  @Register.factory(RemoteUserDataSource, from: RemoteUserDataSourceImpl)
  @Register.factory(LocalUserDataSource, from: LocalUserDataSourceImpl)
  @Register.factory(UserRepository, from: UserRepositoryImpl)
  @Register.singleton(CheckLogin)
  @Register.singleton(GetVerificationCode)
  @Register.singleton(Login)
  @Register.singleton(UpdateUser)
  @Register.singleton(VerifyCode)
  @Register.singleton(Logout)
  void _configure();
}

AuthenticationInjector authenticationInjector() => _$AuthenticationInjector();
