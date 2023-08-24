// {
// "id": 1,
// "username": "John",
// "name": "John Smith",
// "state": "California",
// "avatar_url": "https://assets1.cbsnewsstatic.com/hub/i/2018/11/06/0c1af1b8-155a-458e-b105-78f1e7344bf4/2018-11-06t054310z-1334124005-rc1be15a8050-rtrmadp-3-people-sexiest-man.jpg"
// }

import 'package:bloc_pratice/data/model/data_model.dart';
import 'package:equatable/equatable.dart';

abstract class DataState extends Equatable{}

class DataInitialState extends DataState {
  @override
  List<Object?> get props => throw [];
}

class DataLoadingState extends DataInitialState {}

class DataGetDataState extends DataState {
  final List<DataModel> dataModel;

  DataGetDataState({required this.dataModel});

  @override
  List<Object?> get props => throw [];
}

class DataErrorState extends DataState {
  final String error;
  DataErrorState({required this.error});

  @override
  List<Object?> get props => throw [];
}