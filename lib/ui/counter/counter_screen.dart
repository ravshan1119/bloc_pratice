import 'package:bloc_pratice/cubits/counter/counter_cubit.dart';
import 'package:bloc_pratice/cubits/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  TextEditingController oneController = TextEditingController();
  TextEditingController twoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter Screen"),
        ),
        body:
            BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: oneController,
                  keyboardType: TextInputType.number,
                  onChanged: (v) {
                    context
                        .read<CounterCubit>()
                        .state
                        .copyWith(numOne: num.parse(v));
                    BlocProvider.of<CounterCubit>(context)
                        .calculation(oneController.text, twoController.text);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Ender number",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: twoController,
                  keyboardType: TextInputType.number,
                  onChanged: (v) {
                    context
                        .read<CounterCubit>()
                        .state
                        .copyWith(numTwo: num.parse(v));
                    BlocProvider.of<CounterCubit>(context)
                        .calculation(oneController.text, twoController.text);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Ender number",
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Text(
                  context.read<CounterCubit>().state.summa.toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.blue),
                ),
              ),
            ],
          );
        }));
  }
}
