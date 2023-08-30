import 'package:bloc_pratice/blocs/users/users_event.dart';
import 'package:bloc_pratice/blocs/users/users_state.dart';
import 'package:bloc_pratice/data/local/db/local_db.dart';
import 'package:bloc_pratice/data/model/form_status.dart';
import 'package:bloc_pratice/data/model/users_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc()
      : super(const UsersState(
          status: FormStatus.pure,
          users: [],
          statusText: "",
        )) {
    on<AddUser>(_addUser);
    on<GetUsers>(_getUsers);
    on<UpdateUser>(_updateUser);
    on<DeleteUser>(_deleteUser);
  }

  _addUser(AddUser event, Emitter<UsersState> emit) async {
    emit(state.copyWith(
        status: FormStatus.loading, statusText: "Adding User...!"));
    LocalDatabase.getInstance;
    LocalDatabase.insertUser(event.newUser);
    // await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(
        status: FormStatus.success,
        statusText: "Added User!",
        users: [...state.users, event.newUser]));
  }

  _getUsers(GetUsers event, Emitter<UsersState> emit) async {
    emit(state.copyWith(
        status: FormStatus.loading, statusText: "Getting Users!"));
    // await Future.delayed(const Duration(seconds: 2));
    List<UserModel> users = await LocalDatabase.getAllUsers();

    emit(state.copyWith(
        statusText: "Users Fetched!",
        status: FormStatus.success,
        users: users));
  }

  _updateUser(UpdateUser event, Emitter<UsersState> emit) async {
    emit(state.copyWith(
        status: FormStatus.loading, statusText: "Update User...!"));
    LocalDatabase.updateContact(updatedUser: event.updatedUser);
    List<UserModel> users = await LocalDatabase.getAllUsers();
    emit(state.copyWith(
        statusText: "Updated User!", status: FormStatus.success, users: users));
  }

  _deleteUser(DeleteUser event, Emitter<UsersState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: "Deleting User...",
      ),
    );
    await Future.delayed(const Duration(seconds: 2));

    // List<UserModel> currentUsers = state.users;
    //
    // currentUsers.removeWhere((element) => element.userId == event.userId);
    LocalDatabase.deleteContact(event.userId);
    List<UserModel> users = await LocalDatabase.getAllUsers();
    emit(
      state.copyWith(
        status: FormStatus.success,
        statusText: "Users deleted !!!",
        users: users,
      ),
    );
  }
}
