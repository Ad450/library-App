import 'package:flutter_test/flutter_test.dart';
import 'package:library_project/unilib/core/app_typedefs.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/verify_code.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/generate_mocks.mocks.dart';

void main() {
  late VerifyCode verifyCode;
  late MockUserRepository mockUserRepository;
  setUp(() {
    mockUserRepository = MockUserRepository();
    verifyCode = VerifyCode(mockUserRepository);
  });

  group('verify code', () {
    final voidType = const VoidType();
    test("should call only update user in UserRepository", () {
      when(mockUserRepository.verifyCode(email: "dd@gmail.com", code: "123456"))
          .thenAnswer((realInvocation) async => voidType);

      verifyCode(VerifyCodeParam(email: "dd@gmail.com", code: "123456"));

      verify(mockUserRepository.verifyCode(email: "dd@gmail.com", code: "123456"));
      verifyNoMoreInteractions(mockUserRepository);
    });

    test("should return a user model when update is successful", () async {
      // arrange

      when(mockUserRepository.verifyCode(email: "dd@gmail.com", code: "123456"))
          .thenAnswer((realInvocation) async => voidType);

      // act
      final result = await verifyCode(VerifyCodeParam(email: "dd@gmail.com", code: "123456"));

      // assert

      expect(result.isRight(), true);
      result.fold((l) => null, (r) => expect(r, isA<VoidType>()));
    });

    test("should return an error message when update fails", () async {
      // arrange
      final message = "could not update";

      when(mockUserRepository.verifyCode(email: "dd@gmail.com", code: "123456")).thenThrow(NetworkFailure(message));

      // act
      final result = await verifyCode(VerifyCodeParam(email: "dd@gmail.com", code: "123456"));

      //assert
      expect(result.isLeft(), true);
      result.fold((l) => expect(l.message, message), (r) => null);
    });
  });
}
