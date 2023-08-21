// import 'package:bloc_pratice/cubits/firebase_auth/signup_state.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class SignUpCubit extends Cubit<SignUpState> {
//   SignUpCubit() : super(SignUpState(email: '', password: ''));
//
//   signup(String email, String password) async {
//     try {
//       if (email != "" && password != "") {
//         final credential =
//             await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//         print("if ni ichiga kirdi try dan utib!");
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//
//   login(String email, String password) async{
//     try {
//       if(email!=""&&password!=""){
//         final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//             email: email,
//             password: password
//         );
//         print("##############################################LogIn########################################");
//       }else{
//
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//     }
//   }
// }


import 'package:bloc_pratice/cubits/firebase_auth/signup_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialState());

  Future<void> signIn(String email, String password) async {
    emit(SignInState(login: email, password: password));
    try {
      if(email!=""&&password!=""){
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password
        );
        print("##############################################LogIn########################################");
      }else{

      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    emit(LoggedState());
  }

  Future<void> signUp(String email, String password, String username) async {
    try {
      if (email != "" && password != "") {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print("if ni ichiga kirdi try dan utib!");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    emit(
      SignUpState(
        login: email,
        password: password,
        username: username,
      ),
    );
    await Future.delayed(const Duration(seconds: 3));
    emit(LoggedState());
  }

  logOutUser() {
    emit(UnAuthenticatedState());
  }
}