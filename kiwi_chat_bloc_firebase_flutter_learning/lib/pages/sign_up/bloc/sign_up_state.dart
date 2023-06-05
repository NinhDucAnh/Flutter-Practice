class SignUpState {
  final String userName;
  final String email;
  final String password;

  const SignUpState(
      {this.userName = "", this.email = "", this.password = ""});

  SignUpState copyWith({String? userName, String? email, String? password}) {
    return SignUpState(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password);
  }
}
