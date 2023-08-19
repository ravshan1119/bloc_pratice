import 'package:bloc_pratice/cubits/tab/tab_cubit.dart';
import 'package:bloc_pratice/ui/auth/signup_screen.dart';
import 'package:bloc_pratice/ui/counter/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  static const List<Widget> _widgetOptions = <Widget>[
    CounterScreen(),
    SignUpScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, int>(builder: (context, state) {
      return Scaffold(
        body: IndexedStack(
          index: context.read<TabCubit>().state,
          children: _widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.countertops),
              label: 'Counter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
          ],
          currentIndex: context.read<TabCubit>().state,
          selectedItemColor: Colors.amber[800],
          onTap: (index){
            BlocProvider.of<TabCubit>(context).selectedIndex(index);
          }
        ),
      );
    });
  }
}
