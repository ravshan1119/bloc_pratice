import 'package:bloc_pratice/cubits/firebase_auth/signup_cubit.dart';
import 'package:bloc_pratice/cubits/firebase_auth/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Cubit"),),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Ender email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Ender password",
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (emailController.text != "" &&
                    passwordController.text != "") {
                  BlocProvider.of<LoginCubit>(context)
                      .signIn(emailController.text, passwordController.text);
                  emailController.clear();
                  passwordController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("User LogIn qildi!")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("password or email empty")));
                }
                BlocProvider.of<LoginCubit>(context).signIn(
                    "login", "password");
              },
              child: const Text("SIGN IN USER"),
            ),
            TextButton(
              onPressed: () {
                if (emailController.text != "" &&
                    passwordController.text != "") {
                  BlocProvider.of<LoginCubit>(context)
                      .signUp(emailController.text, passwordController.text,
                      emailController.text);
                  emailController.clear();
                  passwordController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("User Royxatdan otdi!")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("password or email empty")));
                }
                BlocProvider.of<LoginCubit>(context)
                    .signUp("login", "password", "username");
              },
              child: const Text("SIGN UP USER"),
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<LoginCubit>(context).logOutUser();
              },
              child: const Text("LOG OUT USER"),
            ),
            BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
              if (state is InitialState) {
                return const Text(
                  "Hali hech narsa bo'lmadi",
                  style: TextStyle(fontSize: 18),
                );
              }
              if (state is SignInState) {
                return const Text(
                  "Foydalanuvchi Sign In qilyapdi",
                  style: TextStyle(fontSize: 18),
                );
              }

              if (state is SignUpState) {
                return const Text(
                  "Foydalanuvchi Register qilyapdi",
                  style: TextStyle(fontSize: 18),
                );
              }

              if (state is LoggedState) {
                return const Text(
                  "Foydalanuvchi Muvaffaqiyatli Authenticated bo'ldi",
                  style: TextStyle(fontSize: 18),
                );
              }
              return const Text(
                "Foydalanuvchi LOGGED OUT",
                style: TextStyle(fontSize: 18),
              );
            })
          ],
        ),
      ),
    );
  }
}
