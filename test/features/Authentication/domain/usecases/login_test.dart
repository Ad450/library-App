import 'package:flutter_test/flutter_test.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/login.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/generate_mocks.mocks.dart';
import 'package:library_project/unilib/features/Authentication/Data/Models/user_model/user_model.dart';

void main() {
  test("Given a registered name and password, then return a usermodel ", () async {
    // Arrange
    final mockUserRepository = MockUserRepository();
    final login = Login(mockUserRepository);
    final loginParam = LoginParam(email: 'adjeimanue@gmail.com', password: 'Manu450666');
    final user = UserModel(email: 'adjeimanue@gmail.com', name: 'Emmanuel', password: 'Manu450666');
    when(mockUserRepository.login(email: 'adjeimanue@gmail.com', password: 'Manu450666')).thenAnswer((_) async => user);

    // Act

    final actualUser = await login.call(loginParam);

    // Assert

    expect(actualUser.foldRight<UserModel>(user, (r, previous) => r), user);
  });
}
