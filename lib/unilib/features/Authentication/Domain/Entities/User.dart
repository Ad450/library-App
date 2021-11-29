class User {
  final String password;
  final String email;
  final int id;
  dynamic code;

  User(
      {required this.password,
      required this.email,
      required this.id,
      this.code});
}
