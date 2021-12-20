import 'package:library_project/unilib/core/failures.dart';

/// this will return a UIError carrying a more user friendly
/// message to aid comprehension.
/// this takes in a network failure and returns
/// a [UIError] with a custom message
/// this is intended to be used by all usecases

UIError getUIErrorFromNetworkFailure(NetworkFailure networkFailure, StackTrace stackTrace) {
  /// the stackTrace is there for conventional purposes
  /// At this stage can be ignored
  ///
  ///
  return UIError(networkFailure.message);
}

/// similarly, we want to return a network failure
/// this will be used in the repository layer
NetworkFailure networkFailureFromApiFailure(ApiFailure apiFailure, StackTrace stackTrace) {
  /// the stackTrace is there for conventional purposes
  /// At this stage can be ignored
  ///
  return NetworkFailure(apiFailure.message);
}

// lets start with a comment
// we will definitely return an api failure
// the problem now is how to get the particular error

ApiFailure apiFailureFromApis(String errorMessage) {
  // if(errorMessage.contains("host lookup")){
  //   InternetConnectivity.instance().init();
  // }

  return ApiFailure(errorMessage);
}
