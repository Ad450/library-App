import 'package:flutter_test/flutter_test.dart';
import 'package:library_project/unilib/core/app_typedefs.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/get_verification_code.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/generate_mocks.mocks.dart';

// will be testing the get verification code
// ensure that in the get verification code, UserRepository.getVerificationCode is called
// ensure only one interaction to the UserRepository
// ensure getVerificationCode returns a string, code
// ensure that when GetVerificationCode() is called, it returns first a string code, and second a UiError

void main() {
  late MockUserRepository mockUserRepository;
  late GetVerificationCode getVerificationCode;
  setUp(() {
    mockUserRepository = MockUserRepository();
    getVerificationCode = GetVerificationCode(mockUserRepository);
  });

  group("should get verification code", () {
    test('should call only getVerificationCode in userRepository', () async {
      getVerificationCode(GetVerificationCodeParam(email: "adjeimanue@gmail.com", password: "Manu450666"));

      verify(mockUserRepository.getVerificationCode(email: "adjeimanue@gmail.com", password: "Manu450666"));
      verifyNoMoreInteractions(mockUserRepository);
    });

    test("should return a voidType when getVerificationCode is successfull", () async {
      //arrange
      final voidType = const VoidType();
      when(mockUserRepository.getVerificationCode(email: "adjeimanue@gmail.com", password: "Manu450666"))
          .thenAnswer((_) async => voidType);

      // act
      final result =
          await getVerificationCode(GetVerificationCodeParam(email: "adjeimanue@gmail.com", password: "Manu450666"));

      // assert
      expect(result.isRight(), true);
      result.fold((l) => null, (r) => expect(r, isA<VoidType>()));
    });

    test("should return a UIError with message  when unsuccesful", () async {
      // arrange
      final message = "could not get verification code";
      when(mockUserRepository.getVerificationCode(email: "adjeimanue@gmail.com", password: "Manu450666"))
          .thenThrow(NetworkFailure(message));

      // act

      final result =
          await getVerificationCode(GetVerificationCodeParam(email: "adjeimanue@gmail.com", password: "Manu450666"));

      // assert
      expect(result.isLeft(), true);
      result.fold((l) => expect(l, isA<UIError>()), (r) => null);
      result.fold((l) => expect(l.message, message), (r) => null);
    });
  });
}
// testing is actually testing all angles and all possible scenarios
