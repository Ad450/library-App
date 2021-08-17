class User {
  String? userName;
  int? id;
  String? email;
  String? password;
  String? universityName;
  String? profileImage;
  String? programOfStudy;
  String? fullname;
  int? level;

  User(
      {this.email,
      this.id,
      this.password,
      this.universityName,
      this.userName,
      this.profileImage,
      this.programOfStudy,
      this.fullname,
      this.level});

  factory User.fromMap(Map datafromApi) {
    return User(
        email: datafromApi["email"],
        userName: datafromApi["username"],
        profileImage: datafromApi["profile_image"],
        programOfStudy: datafromApi["program_of_study"],
        level: datafromApi["level"],
        fullname: datafromApi["fullname"],
        universityName: datafromApi["university_name"],
        id: datafromApi["id"]);
  }

  Map<String, dynamic> _returnUserObject(String? email, String? password) {
    return {"email": email, "password": password};
  }

  Map<String, dynamic> userMap(String? email, String? password) {
    return _returnUserObject(email, password);
  }

  Map<String, dynamic>? _userMapForVerification(String? email) {
    return {"email": email};
  }

  Map<String, dynamic>? getUserMapFromVerification(String? email) {
    if (email == null) return null;
    return _userMapForVerification(email);
  }
}
