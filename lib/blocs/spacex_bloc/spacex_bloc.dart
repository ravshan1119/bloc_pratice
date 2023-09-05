import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_pratice/api/model/spacex_model.dart';
import 'package:bloc_pratice/api/production_api.dart';
import 'package:meta/meta.dart';

part 'spacex_event.dart';
part 'spacex_state.dart';

class SpacexBloc extends Bloc<SpacexEvent, SpacexState> {
  SpacexBloc({required CountriesApiClient jobsApiClient}) : _jobsApiClient = jobsApiClient, super(SpacexInitialState()) {
    on<SpacexFetchStarted>((event, emit) {
      // TODO: implement event handler
    });
  }
  final CountriesApiClient _jobsApiClient;

  Future<void> _onCountriesFetchStarted(
      SpacexFetchStarted event,
      Emitter<SpacexState> emit,
      ) async {
    emit(SpacexLoadingState());
    try {
      final productions = await _jobsApiClient.getCountries();
      emit(SpacexSuccessState(productions: productions));
    } catch (error) {
      print("ERRROR:$error");
      emit(SpacexFailureState());
    }
  }
}
