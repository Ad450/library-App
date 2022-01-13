import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/features/Authentication/Domain/UseCases/get_verification_code.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/generate_mocks.mocks.dart';
import 'package:library_project/unilib/features/Authentication/Data/Models/user_model/user_model.dart';

// will be testing the get verification code

void main() {
  test('should send otp to test phone number when getVerificationCode is called with the test phone number', () async {
    // Arrange
    final failure = UIError('could not get otp from the server');
    final mockUserRespository = MockUserRepository();
    final getVerificationCode = GetVerificationCode(mockUserRespository);
    when(
      mockUserRespository.getVerificationCode(email: 'adjeimanue@gmail.com', password: 'Manu450666'),
    ).thenAnswer(
      (_) async => ApiFailure('could not perform operation'),
    );

    // Act
    final actual =
        await getVerificationCode.call(GetVerificationCodeParam(email: 'adjeimanue@gmail.com', password: 'Manu450666'));

    // Assert

    expect(actual.leftMap<UIError>((l) => l), failure);
  });
}
