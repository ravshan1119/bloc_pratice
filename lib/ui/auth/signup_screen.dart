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
      appBar: AppBar(
        title: const Text("Sign Up Screen"),
      ),
      body: BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
        return Column(
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
            const SizedBox(height: 100),
            TextButton(
                onPressed: () {
                  if (emailController.text != "" &&
                      passwordController.text != "") {
                    BlocProvider.of<SignUpCubit>(context)
                        .signup(emailController.text, passwordController.text);
                    emailController.clear();
                    passwordController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("User Royxatdan otdi!")));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("password or email empty")));
                  }
                },
                child: const Text("SignUp")),

            const SizedBox(height: 40),
            TextButton(
                onPressed: () {
                  if (emailController.text != "" &&
                      passwordController.text != "") {
                    BlocProvider.of<SignUpCubit>(context)
                        .login(emailController.text, passwordController.text);
                    emailController.clear();
                    passwordController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("User LogIn qildi!")));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("password or email empty")));
                  }
                },
                child: const Text("LogIn")),

          ],
        );
      }),
    );
  }
}
