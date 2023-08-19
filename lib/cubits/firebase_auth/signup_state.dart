

class SignUpState {
  final String email;
  final String password;

  SignUpState({
    required this.email,
    required this.password,
  });

  SignUpState copyWith({
    String? email,
    String? password,
  }) =>
      SignUpState(
        email: email ?? this.email,
        password: password ?? this.password,
      );
}
