// enum VerificationState { LOADING, LOADED, ERROR }

abstract class VerificationState {}

class VerificationLoading extends VerificationState {}

class VerificationLoaded extends VerificationState {}

class VerificationError extends VerificationState {
  String error;
  VerificationError(this.error);
}
