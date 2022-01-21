import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_project/unilib/core/data/network/network_response.dart';
import 'package:library_project/unilib/core/data/network/network_service_impl.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:library_project/unilib/core/utils/app_strings.dart';

// setup variables for all test cases

late NetworkServiceImpl networkService;
late Dio dio;
late DioAdapter dioAdapter;

void main() {
  // initialize setup variables
  setUp(() {
    networkService = NetworkServiceImpl();
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
  });

  group("network service", () {
    // fake endpoint
    const path = "dummy/api/url";
    const response = <String, dynamic>{
      'data': {'data': "emmanuel"}
    };
    test('get request returns NetworkResponse that contains data ', () async {
      // ARRANGE

      dioAdapter.onGet(path, (server) {
        server.reply(
          200,
          response,
        );
      });

      // ACT
      // calling the networkService.get() to return a networkResponse
      final result = await networkService.get(url: path);

      //ASSERT
      expect(result, isA<NetworkResponse>());
      // expect(result.data, equals(response['data']));
    });

    test('get request returns a networkResponse that contains error', () async {
      // ARRANGE
      // mocking dio with dioAdapter
      final error = DioError(
          requestOptions: RequestOptions(path: path),
          response: Response(statusCode: 404, requestOptions: RequestOptions(path: path)));

      dioAdapter.onGet(path, (server) {
        server.throws(
          404,
          error,
        );
      });

      // ACT
      // call network service.post() to return a network Response containing field error
      final result = await networkService.post(url: path, body: {'user': 'emmanuel'});

      // ASSERT
      // expect result to be a networkResponse and data to contain key `error`
      expect(result, isA<NetworkResponse>());
      expect(result.data['error'], isA<ApiErrors>());
    });

    test('post request returns NetworkResult ', () async {
      // ACT
      // mocking dio with dioAdapter
      dioAdapter.onPost(path, (server) {
        server.reply(200, response);
      });

      // ARRANGE
      final result = await networkService.post(url: path, body: {"user": "emmanuel"});

      // ASSERT

      expect(result, isA<NetworkResponse>());
    });

    test('post request returns a networkResponse that contains error', () async {
      // ARRANGE
      // mocking dio with dioAdapter
      final error = DioError(
          requestOptions: RequestOptions(path: path),
          response: Response(statusCode: 404, requestOptions: RequestOptions(path: path)));

      dioAdapter.onPost(path, (server) {
        server.throws(
          404,
          error,
        );
      });

      // ACT
      // call network service.post() to return a network Response containing field error
      final result = await networkService.post(url: path, body: {'user': 'emmanuel'});

      // ASSERT
      // expect result to be a networkResponse and data to contain key `error`
      expect(result, isA<NetworkResponse>());
      expect(result.data['error'], isA<ApiErrors>());
    });
  });
}


// what to test 
// `get`
// `post`

// what you need to be able to test the above
// setup
// `dio.get()`
//  mock dio by using dioAdapters
// return a response using the dioAdapters
// 

