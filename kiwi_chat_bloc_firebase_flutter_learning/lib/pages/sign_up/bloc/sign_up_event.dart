abstract class SignUpEvent{
  const SignUpEvent();
}

class UserNameEvent extends SignUpEvent{
  final String userName;
  const UserNameEvent(this.userName);
}

class EmailAddressEvent extends SignUpEvent{
  final String email;
  const EmailAddressEvent(this.email);
}

class PasswordEvent extends SignUpEvent{
  final String password;
  const PasswordEvent(this.password);
}
