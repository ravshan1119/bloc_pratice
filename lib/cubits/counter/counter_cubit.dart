import 'dart:math';

import 'package:bloc_pratice/cubits/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState());



  calculation(String numOne,String numTwo){
    CounterState counterState = CounterState(summa: pow(num.parse(numOne), num.parse(numTwo)));
    print("${state.numOne}   ${state.numTwo}");
    emit(counterState);
  }
}