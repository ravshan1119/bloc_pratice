import 'package:bloc_pratice/data/model/users_model.dart';
import 'package:equatable/equatable.dart';

abstract class UsersEvent extends Equatable {}

class AddUser extends UsersEvent {
  final UserModel newUser;

  AddUser({required this.newUser});

  @override
  List<Object?> get props => [];
}

class UpdateUser extends UsersEvent {
  final UserModel updatedUser;

  UpdateUser({required this.updatedUser});

  @override
  List<Object?> get props => [];
}

class DeleteUser extends UsersEvent {
  final int userId;

  DeleteUser({required this.userId});

  @override
  List<Object?> get props => [];
}

class GetUsers extends UsersEvent {
  @override
  List<Object?> get props => [];
}
