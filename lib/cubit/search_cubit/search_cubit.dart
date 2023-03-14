import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_taxi/cubit/search_cubit/search_state.dart';
import 'package:lady_taxi/data/models/app_model.dart';
import 'package:lady_taxi/data/models/search_model/search_model.dart';
import 'package:lady_taxi/data/repository/search_repository/search_repository.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepository}) : super(SearchInitialState());
  SearchRepository searchRepository;
  getSearch(String search) async {
    emit(SearchLoadinglState());
    AppResponse appResponse = await searchRepository.getSearch(search);
    if (appResponse.errorTxt.isEmpty) {
      emit(SearchSuccesState(searchModel: appResponse.data as SearchModel));
    } else {
      emit(SearchErrorState(errorTxt: appResponse.errorTxt));
    }
  }
}
