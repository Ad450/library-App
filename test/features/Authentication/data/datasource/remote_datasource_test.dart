import 'package:flutter_test/flutter_test.dart';
import 'package:library_project/unilib/core/data/network/network_response.dart';
import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/features/Authentication/Data/DataSources/remote_data_source.dart';
import 'package:mockito/mockito.dart';
import '../../../../core/generate_mocks.mocks.dart';
import '../../../../../lib/unilib/features/Authentication/Data/Models/user_model/user_model.dart';

void main() {
  late RemoteUserDataSourceImpl remoteUserDataSourceImpl;
  late MockNetworkService mockNetworkService;
  setUp(() {
    mockNetworkService = MockNetworkService();
    remoteUserDataSourceImpl = RemoteUserDataSourceImpl(mockNetworkService);
  });

  group("remote datasource impl", () {
    group('get verification link/code', () {
      test("should make a post req to auth/resend-verification-link", () async {
        // arrange
        final email = "dd@gmail.com";
        final password = "12345";
        final response = NetworkResponse(data: {"code": ""}, result: NetworkResult.SUCCESS);
        when(mockNetworkService.post(url: 'auth/resend-verification-link', body: {"email": email}))
            .thenAnswer((_) async => response);

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

        // should throw an apiFailure when remote.getVerificationCode is called

        expect(
          remoteUserDataSourceImpl.getVerificationCode(email: email, password: password),
          throwsA(isA<ApiFailure>()),
        );
      });
    });

    group("login", () {
      test("login returns a user model when successful", () async {
        // we need a mock network service
        // ARRANGE
        //  final testModel = UserModel(email: "dd@gmail.com", password: "emmanuel", name: "dd");
        when(mockNetworkService.post(url: 'auth/login', body: {"email": "dd@gmail.com", "password": "12345"}))
            .thenAnswer((_) async => NetworkResponse(
                data: {'email': "dd@gmail.com", "name": "dillon", "password": "12345"}, result: NetworkResult.SUCCESS));

        // call remote datasource login
        //ACT
        final result = await remoteUserDataSourceImpl.login(email: "dd@gmail.com", password: '12345');

        // expect a user model from the login call
        // ASSERT
        // should call network.post in the remoteDatasourceImpl.login method
        verify(mockNetworkService.post(url: 'auth/login', body: {"email": "dd@gmail.com", "password": "12345"}));
        expect(result, isA<UserModel>());
      });
    });
  });
}

//Creativity is contagious, so pass it on