abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadinglState extends SearchState {}

class SearchErrorState extends SearchState {
  SearchErrorState({required this.errorTxt});
  String errorTxt;
}
