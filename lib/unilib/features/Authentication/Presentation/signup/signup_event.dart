abstract class Events {}

class SignUpEvents extends Events {
  String email;
  String name;

  SignUpEvents({required this.email, required this.name});

 factory SignUpEvents.containUserInfo({required String email, required String name}){
    return SignUpEvents(email:email, name : name);
  }
}

// enum SignUpEvents{
//   LOADING,
//   LOADED,
//   ERROR
// }


