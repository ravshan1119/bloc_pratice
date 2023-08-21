import 'package:bloc_pratice/cubits/view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitView extends Cubit<ViewState> {
  CubitView() : super(InitialState());

  List<int> list = [];

  change(int index) {
    emit(SelectedState());
    if (list.contains(index)) {
      list.remove(index);
    } else {
      list.add(index);
    }
    emit(InitialState());
  }
}
