import 'package:bloc_pratice/cubits/firebase_auth/signup_cubit.dart';
import 'package:bloc_pratice/cubits/tab/tab_cubit.dart';
import 'package:bloc_pratice/ui/tab/tab_box.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/counter/counter_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => CounterCubit(),
        lazy: true,
      ),
      BlocProvider(
        create: (_) => TabCubit(),
        lazy: true,
      ),
      BlocProvider(
        create: (_) => SignUpCubit(),
        lazy: true,
      )
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBox(),
    );
  }
}
