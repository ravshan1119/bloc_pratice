import 'package:bloc_pratice/cubits/cubit.dart';
import 'package:bloc_pratice/cubits/view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("nimadur"),
      ),
      body: BlocBuilder<CubitView, ViewState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...List.generate(
                        10,
                        (index) => Padding(
                              padding: const EdgeInsets.all(1),
                              child: GestureDetector(
                                onTap: () {
                                  context.read<CubitView>().change(index);
                                  print(context.read<CubitView>().list);
                                },
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  color: context
                                          .read<CubitView>()
                                          .list
                                          .contains(index)
                                      ? Colors.grey
                                      : Colors.blue,
                                ),
                              ),
                            ))
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
