//enum SignUpState { LOADING, LOADED, ERROR }


abstract class AuthState{}

class SignUpState extends AuthState{
  String? errorMessage;
  SignUpState({this.errorMessage});

  factory SignUpState.withError({String? errorMessage}){
    return SignUpState(errorMessage: errorMessage);
  }

  factory SignUpState.loading({String? errorMessage}) {
    return SignUpState(errorMessage: errorMessage);
  }

  
  factory SignUpState.loaded({String? errorMessage}) {
    return SignUpState(errorMessage: errorMessage);
  }

  

}

