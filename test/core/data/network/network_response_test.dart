import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_project/unilib/core/data/network/network_response.dart';
import 'package:library_project/unilib/core/utils/app_strings.dart';

void main() {
  group('network response', () {
    const path = "dummyEndpoint";
    test('should return a network response whose data contains key data', () {
      // we need a response object and a networkResponse object

      final response = Response(data: <String, dynamic>{
        "data": {"message": "yay! it worked"},
      }, statusCode: 200, requestOptions: RequestOptions(path: path));

      // pass the response to the handleResponse method
      final result = handleResponse(response);

      // expect a networkResponse containing data as Map with key data
      expect(result, isA<NetworkResponse>());
      expect(result.data['message'], isA<String>());
    });

    test('should return a network response with error key', () {
      // testing network response error will require an instance of Dioerrro
      // ARRANGE
      final dioError = DioError(
          requestOptions: RequestOptions(path: path),
          response: Response(statusCode: 400, requestOptions: RequestOptions(path: path)));

      // ACT
      // call handleErrorResponse passing in an instance of dioError
      final result = handleErrorResponse(dioError);

      // ASSERT
      // expect a networkResponse from handelErrorResponse
      expect(result, isA<NetworkResponse>());
      // expect and apiError from result.data
      expect(result.data['error'], isA<ApiErrors>());
    });
  });
}
