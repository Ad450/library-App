import 'package:library_project/unilib/core/failures.dart';

Future<T> guardedApiCall<T>(Function run, {String errorMessage = ""}) async {
  try {
    return await run() as T;
  } on ApiFailure catch (e) {
    throw NetworkFailure(e.message);
  } catch (_) {
    TODO: // proper string to be inserted here
    throw NetworkFailure("something bad happened");
  }
}

guardedCache<T>(Function run, {String errorMessage = ""}) async {
  try {
    return await run() as T;
  } on DatabaseFailure catch (e) {
    throw CacheFailure(e.message);
  } catch (_) {
    throw CacheFailure("something bad happened. Couldnot cache ");
  }
}
