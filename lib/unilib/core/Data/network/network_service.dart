import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:library_project/unilib/core/Data/network/network_response.dart';
import 'package:library_project/unilib/core/Data/network/network_result.dart';

abstract class NetworkService {
  Future<NetworkResponse> post(
      {required dynamic url,
      Map<String, String>? headers,
      required Map<String, dynamic> body});

  Future<NetworkResponse> get({required dynamic url});
}
