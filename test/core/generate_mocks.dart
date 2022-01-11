
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/check_login.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/getVerificationCode.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/login.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/logout.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/verify_code.dart';
import 'package:library_project/unilib/features/account/domain/usecases/update_user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([CheckLogin, GetVerificationCode, Login, Logout, UpdateUser, VerifyCode])
void main(){}
