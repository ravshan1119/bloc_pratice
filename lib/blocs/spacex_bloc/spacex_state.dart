part of 'spacex_bloc.dart';

@immutable
abstract class SpacexState {}

class SpacexInitialState extends SpacexState {}

class SpacexLoadingState extends SpacexState {}

class SpacexSuccessState extends SpacexState {
  final List<SpaceXModel> productions;

  SpacexSuccessState({required this.productions});
}

class SpacexFailureState extends SpacexState {}
