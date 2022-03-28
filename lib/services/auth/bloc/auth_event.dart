abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventInitialze extends AuthEvent {
  const AuthEventInitialze();
}

class AuthEventLogIn extends AuthEvent {
  final String email;
  final String password;

  const AuthEventLogIn(this.email, this.password);
}

class AuthEventLogOut extends AuthEvent {
  const AuthEventLogOut();
}
