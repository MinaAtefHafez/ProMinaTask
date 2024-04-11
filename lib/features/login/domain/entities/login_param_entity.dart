class LoginParamEntity {
  final String? email;
  final String? password;

  LoginParamEntity({this.email = '', this.password = ''});

  LoginParamEntity copyWith({String? email, String? password}) {
    return LoginParamEntity(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
