import 'package:lady_taxi/data/models/search_model/search_model.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadinglState extends SearchState {}

class SearchErrorState extends SearchState {
  SearchErrorState({required this.errorTxt});
  String errorTxt;
}

class SearchSuccesState extends SearchState {
  SearchSuccesState({required this.searchModel});
  SearchModel searchModel;
}
