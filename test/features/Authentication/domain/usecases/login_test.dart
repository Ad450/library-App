import 'package:flutter_test/flutter_test.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/login.dart';
import 'package:mockito/mockito.dart';
import '../../../../core/generate_mocks.mocks.dart';
import 'package:library_project/unilib/features/Authentication/Data/Models/user_model/user_model.dart';

void main() {
  late MockUserRepository mockUserRepository;
  late Login login;
  setUp(() {
    mockUserRepository = MockUserRepository();
    login = Login(mockUserRepository);
  });
  group("Login usecase ", () {
    test("should call only login from user repository", () {
      when(mockUserRepository.login(email: "adjei@gmail.com", password: "manu"))
          .thenAnswer((_) async => UserModel(email: "adjei@gmail.com", name: "adjei", password: "manu"));

      login(LoginParam(email: "adjei@gmail.com", password: "manu"));

      verify(mockUserRepository.login(email: "adjei@gmail.com", password: "manu"));
      verifyNoMoreInteractions(mockUserRepository);
    });

    test("should return a user model when provided info", () async {
      // arrange
      when(mockUserRepository.login(email: "adjei@gmail.com", password: "manu"))
          .thenAnswer((realInvocation) async => UserModel(email: "adjei@gmail.com", name: "adjei", password: "manu"));

      // act
      final result = await login(LoginParam(email: "adjei@gmail.com", password: "manu"));

      // assert
      expect(result.isRight(), true);
      result.fold((l) => null, (r) => expect(r, isA<UserModel>()));
    });

    test("should return an error message when login fails", () async {
      // arrange
      final message = "could not login";
      when(mockUserRepository.login(email: "adjei@gmail.com", password: "manu")).thenThrow(NetworkFailure(message));

      // act
      final result = await login(LoginParam(email: "adjei@gmail.com", password: "manu"));

      //assert
      expect(result.isLeft(), true);
      result.fold((l) => expect(l.message, message), (r) => null);
    });
  });
}
