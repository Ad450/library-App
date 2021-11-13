//enum SignUpState { LOADING, LOADED, ERROR }


abstract class SignUpState {
  String? errorMessage;
  dynamic data;

  SignUpState({this.data, this.errorMessage});
}

class SignUpLoadingState extends SignUpState {}

class SignUpErrorState extends SignUpState {
 
  SignUpErrorState({required String error}) :super(errorMessage: error);

  
}


class SignUpLoadedState extends SignUpState{}