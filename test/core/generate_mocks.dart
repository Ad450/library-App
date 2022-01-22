import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:library_project/unilib/core/data/network/network_service.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';
import 'package:library_project/unilib/features/account/domain/repository/account_repository.dart';
import 'package:library_project/unilib/features/books/Domain/repository/books_repositroy.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([UserRepository, BookRepository, AccountRepository, NetworkService, Dio, HiveInterface, Box])
void main() {}
