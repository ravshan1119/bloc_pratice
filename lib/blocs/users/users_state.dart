import 'package:bloc_pratice/data/model/form_status.dart';
import 'package:bloc_pratice/data/model/users_model.dart';
import 'package:equatable/equatable.dart';

class UsersState extends Equatable {
  const UsersState(
      {required this.status, required this.users, required this.statusText});

  final FormStatus status;
  final List<UserModel> users;
  final String statusText;

  UsersState copyWith({
    FormStatus? status,
    String? statusText,
    List<UserModel>? users,
  }) =>
      UsersState(
        status: status ?? this.status,
        users: users ?? this.users,
        statusText: statusText ?? this.statusText,
      );

  @override
  List<Object?> get props => [status, users, statusText];
}
