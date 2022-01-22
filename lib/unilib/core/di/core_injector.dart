import 'package:kiwi/kiwi.dart';
import 'package:library_project/unilib/core/data/database/database_service.dart';
import 'package:library_project/unilib/core/data/database/database_service_impl.dart';
import 'package:library_project/unilib/core/data/network/network_service.dart';
import 'package:library_project/unilib/core/data/network/network_service_impl.dart';
part 'core_injector.g.dart';

abstract class CoreInjector {
  static late KiwiContainer container;
  static final resolve = container.resolve;

  void setUp() {
    container = KiwiContainer();

    _$CoreInjector()._configure();
  }

  @Register.factory(NetworkService, from: NetworkServiceImpl)
  @Register.singleton(Database, from: BookDatabaseServiceImpl)
  void _configure();
}

CoreInjector coreInjector() => _$CoreInjector();
