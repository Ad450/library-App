import 'package:flutter_test/flutter_test.dart';
import 'package:library_project/unilib/core/app_typedefs.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/logout.dart';

import 'package:mockito/mockito.dart';

import '../../../../core/generate_mocks.mocks.dart';

void main() {
  late Logout logout;
  late MockUserRepository mockUserRepository;
  setUp(() {
    mockUserRepository = MockUserRepository();
    logout = Logout(mockUserRepository);
  });

  group('verify code', () {
    final voidType = const VoidType();
    test("should call only logout in UserRepository", () {
      when(mockUserRepository.logout()).thenAnswer((realInvocation) async => voidType);

      logout(NoParam());

      verify(mockUserRepository.logout());
      verifyNoMoreInteractions(mockUserRepository);
    });

    test("should return a void type when update is successful", () async {
      // arrange

      when(mockUserRepository.logout()).thenAnswer((realInvocation) async => voidType);
      // act
      final result = await logout(NoParam());

      // assert

      expect(result.isRight(), true);
      result.fold((l) => null, (r) => expect(r, isA<VoidType>()));
    });

    test("should return an error message when logout fails", () async {
      // arrange
      final message = "could not logout";

      when(mockUserRepository.logout()).thenThrow(CacheFailure(message));
      // act
      final result = await logout(NoParam());

      //assert
      expect(result.isLeft(), true);
      result.fold((l) => expect(l.message, message), (r) => null);
    });
  });
}
