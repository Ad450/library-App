import 'package:kiwi/kiwi.dart';
import 'package:library_project/unilib/features/account/data/repository/account_repository_impl.dart';
import 'package:library_project/unilib/features/account/domain/repository/account_repository.dart';
part 'account_injector.g.dart';

abstract class AccountInjector {
  static late KiwiContainer container;
  static final resolve = container.resolve;

  void setup() {
    container = KiwiContainer();
    _$AccountInjector()._configure();
  }

  @Register.factory(AccountRepository, from: AccountRepositoryImpl)
  void _configure();
}

AccountInjector accountInjector() => _$AccountInjector();
