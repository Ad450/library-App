import 'package:flutter_test/flutter_test.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/features/account/domain/usecases/update_user.dart';
import 'package:mockito/mockito.dart';
import 'package:library_project/unilib/features/Authentication/Data/Models/user_model/user_model.dart';

import '../../../../core/generate_mocks.mocks.dart';

void main() {
  late MockAccountRepository mockAccountRepository;
  late UpdateUser updateUser;
  setUp(() {
    mockAccountRepository = MockAccountRepository();
    updateUser = UpdateUser(mockAccountRepository);
  });

  group("Update user", () {
    test("should call only update user in UserRepository", () {
      when(mockAccountRepository.updateUser(name: "emmanuel", email: "dd@gmail.com", password: "23423"))
          .thenAnswer((realInvocation) async => UserModel(name: "Emmanuel", password: "23423", email: "dd@gmail.com"));

      updateUser(UpdateUserParam(email: "dd@gmail.com", name: "emmanuel", password: "23423"));

      verify(mockAccountRepository.updateUser(email: "dd@gmail.com", name: "emmanuel", password: "23423"));
      verifyNoMoreInteractions(mockAccountRepository);
    });

    test("should return a user model when update is successful", () async {
      // arrange

      when(mockAccountRepository.updateUser(name: "emmanuel", email: "dd@gmail.com", password: "23423"))
          .thenAnswer((realInvocation) async => UserModel(name: "Emmanuel", password: "23423", email: "dd@gmail.com"));

      // act
      final result = await updateUser(UpdateUserParam(email: "dd@gmail.com", name: "emmanuel", password: "23423"));

      // assert

      expect(result.isRight(), true);
      result.fold((l) => null, (r) => expect(r, isA<UserModel>()));
    });

    test("should return an error message when update fails", () async {
      // arrange
      final message = "could not update";
      when(mockAccountRepository.updateUser(name: "emmanuel", email: "dd@gmail.com", password: "23423"))
          .thenThrow(NetworkFailure(message));

      // act
      final result = await updateUser(UpdateUserParam(email: "dd@gmail.com", name: "emmanuel", password: "23423"));

      //assert
      expect(result.isLeft(), true);
      result.fold((l) => expect(l.message, message), (r) => null);
    });
  });
}
