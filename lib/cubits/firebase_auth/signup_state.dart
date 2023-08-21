
//
// class SignUpState {
//   final String email;
//   final String password;
//
//   SignUpState({
//     required this.email,
//     required this.password,
//   });
//
//   SignUpState copyWith({
//     String? email,
//     String? password,
//   }) =>
//       SignUpState(
//         email: email ?? this.email,
//         password: password ?? this.password,
//       );
// }

class LoginState {}

class InitialState extends LoginState {}

class SignInState extends LoginState {
  final String login;
  final String password;

  SignInState({required this.login, required this.password});
}

class SignUpState extends LoginState {
  final String login;
  final String username;
  final String password;

  SignUpState({
    required this.login,
    required this.password,
    required this.username,
  });
}

class LoggedState extends LoginState {}

class UnAuthenticatedState extends LoginState {}
