import 'dart:math';

import 'package:bloc_pratice/cubits/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState());

  updateNumTwo(num newNum) {
    // UserModel currentUser = state;
    emit(state.copyWith(numOne: newNum));
  }
  updateNumOne(num newNum) {
    // UserModel currentUser = state;
    emit(state.copyWith(numTwo: newNum));
  }

  calculation(){
    CounterState counterState = CounterState(summa: pow(state.numOne, state.numTwo));
    emit(counterState);
  }
}