import 'package:flutter_test/flutter_test.dart';
import 'package:library_project/unilib/core/data/network/network_response.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/features/Authentication/Data/DataSources/remote_data_source.dart';
import 'package:mockito/mockito.dart';
import '../../../../core/generate_mocks.mocks.dart';

void main() {
  late RemoteUserDataSourceImpl remoteUserDataSourceImpl;
  late MockNetworkService mockNetworkService;
  setUp(() {
    mockNetworkService = MockNetworkService();
    remoteUserDataSourceImpl = RemoteUserDataSourceImpl(mockNetworkService);
  });

  group('User Auth remote data source', () {
    test("should make a post req to auth/resend-verification-link", () async {
      // arrange
      final email = "dd@gmail.com";
      final password = "12345";
      final response = NetworkResponse(data: {"code": ""}, result: NetworkResult.SUCCESS);
      when(mockNetworkService.post(url: 'auth/resend-verification-link', body: {"email": email}))
          .thenAnswer((realInvocation) async => response);

      // act

      await remoteUserDataSourceImpl.getVerificationCode(email: email, password: password);

      // assert
      verify(mockNetworkService.post(url: 'auth/resend-verification-link', body: {"email": email}));
    });

    test('should throw an ApiError if network result is not successful', () async {
      // arrange
      final email = "dd@gmail.com";
      final password = "12345";
      final message = 'error occured';
      // mocking network.post. This returns a network response with an unsuccessful result
      when(mockNetworkService.post(url: 'auth/resend-verification-link', body: {"email": email})).thenAnswer(
          (_) async =>
              NetworkResponse(data: {'error': "error-message", "message": message}, result: NetworkResult.FAILURE));
      // act
      // call remoteUserDataSourceImpl.getVerificationCode
      await remoteUserDataSourceImpl.getVerificationCode(email: email, password: password);

      // assert
      // verify that network.post is called in getVerificationCode
      verify(mockNetworkService.post(url: 'auth/resend-verification-link'));

      // should throw an apiFailure when remote.getVerificationCode is called
      expect(
        remoteUserDataSourceImpl.getVerificationCode(email: email, password: password),
        throwsA(isA<ApiFailure>()),
      );
    });
  });
}
