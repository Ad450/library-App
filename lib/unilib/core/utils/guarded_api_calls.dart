import 'dart:io';

import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/core/utils/app_strings.dart';

Future<T> guardedApiCall<T>(Function run, {String errorMessage = ""}) async {
  try {
    // InternetConnectivity.instance().init();
    return await run() as T;
  } on ApiFailure catch (e) {
    throw NetworkFailure(e.message);
  } on SocketException catch (e) {
    if (e.message.contains('host lookup')) {
      throw NetworkFailure('no internet');
    } else {
      throw NetworkFailure(AppStrings.apiErrors[ApiErrors.apiUnknown]!);
    }
  }
}

guardedCache<T>(Function run, {String errorMessage = ""}) async {
  try {
    return await run() as T;
  } on DatabaseFailure catch (e) {
    throw CacheFailure(e.message);
  } catch (_) {
    throw CacheFailure(AppStrings.apiErrors[ApiErrors.databaseException]!);
  }
}
