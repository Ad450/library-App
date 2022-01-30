import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:library_project/unilib/core/data/database/database_service.dart';
import 'package:library_project/unilib/core/data/network/network_service.dart';
import 'package:library_project/unilib/features/Authentication/Domain/Repository/user_repository.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/check_login.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/get_verification_code.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/login.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/logout.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/verify_code.dart';
import 'package:library_project/unilib/features/account/domain/repository/account_repository.dart';
import 'package:library_project/unilib/features/account/domain/usecases/update_user.dart';
import 'package:library_project/unilib/features/books/Domain/repository/books_repositroy.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  UserRepository,
  BookRepository,
  AccountRepository,
  NetworkService,
  Dio,
  HiveInterface,
  Box,
  Login,
  GetVerificationCode,
  UpdateUser,
  VerifyCode,
  Logout,
  CheckLogin,
  Database
])
void main() {}
