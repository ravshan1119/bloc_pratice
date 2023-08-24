import 'package:bloc_pratice/cubits/data_state.dart';
import 'package:bloc_pratice/data/api_sevice.dart';
import 'package:bloc_pratice/data/universal_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitialState());

  ApiService apiService = ApiService();

  Future<void> fetchData() async {
    emit(DataLoadingState());
    UniversalData universalData = await apiService.getData();
    if (universalData.error.isEmpty) {
      emit(DataGetDataState(dataModel: universalData.data));
    } else {
      emit(DataErrorState(error: universalData.error.toString()));
    }
  }
}
