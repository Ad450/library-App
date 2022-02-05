import 'package:dio/dio.dart';
import 'package:library_project/unilib/core/data/network/network_response.dart';
import 'package:library_project/unilib/core/data/network/network_service.dart';
import 'package:library_project/unilib/core/configureUrls.dart';

class NetworkServiceImpl implements NetworkService {
  late Dio _dio;

  NetworkServiceImpl() {
    _dio = Dio(BaseOptions(connectTimeout: 10000, baseUrl: kBaseUrl, contentType: "application/json"));

    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) => handler.resolve(
          Response(
              statusCode: response.statusCode,
              requestOptions: RequestOptions(path: kBaseUrl),
              headers: response.headers,
              statusMessage: response.statusMessage,
              extra: response.extra,
              data: response.data),
        ),
      ),
    );
  }

  @override
  Future<NetworkResponse> get({required url}) async {
    try {
      final _response = await _dio.get(url);
      return handleResponse(_response);
    } on DioError catch (e) {
      return handleErrorResponse(e);
    }
  }

  @override
  Future<NetworkResponse> post({required url, Map<String, String>? headers, required Map<String, dynamic> body}) async {
    try {
      final _response = await _dio.post(url, data: body);
      return handleResponse(_response);
    } on DioError catch (e) {
      return handleErrorResponse(e);
    }
  }
}
