enum UserType {ALUNO, SERVIDOR}

class User {

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.type = UserType.ALUNO,
  });

  String name;
  String email;
  String phone;
  String password;
  UserType type;
}