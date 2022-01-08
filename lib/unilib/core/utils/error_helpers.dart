import 'package:library_project/unilib/core/failures.dart';
import 'package:library_project/unilib/core/platform/connectivity.dart';
import 'package:library_project/unilib/core/utils/logger.dart';

/// this will return a UIError carrying a more user friendly
/// message to aid comprehension.
/// this takes in a network failure and returns
/// a [UIError] with a custom message
/// this is intended to be used by all usecases

UIError getUIErrorFromFailure(Failure failure, StackTrace stackTrace) {
  /// the stackTrace is there for conventional purposes
  /// At this stage can be ignored
  ///
  ///
  logger.d(failure.message);
  return UIError(failure.message);
}

/// similarly, we want to return a network failure
/// this will be used in the repository layer
NetworkFailure networkFailureFromApiFailure(ApiFailure apiFailure, StackTrace stackTrace) {
  /// the stackTrace is there for conventional purposes
  /// At this stage can be ignored
  ///
  logger.d(apiFailure.message);
  throw NetworkFailure(apiFailure.message);
}

// lets start with a comment
// we will definitely return an api failure
// the problem now is how to get the particular error

ApiFailure apiFailureFromApis(String errorMessage) {
  InternetConnectivity.instance().init();

  logger.d(errorMessage);
  throw ApiFailure(errorMessage);
}
