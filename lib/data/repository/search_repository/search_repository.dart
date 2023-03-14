import 'package:lady_taxi/data/api/search_api/search_api.dart';
import 'package:lady_taxi/data/models/app_model.dart';

class SearchRepository {
  SearchRepository({required this.apiService});
  SearchApiService apiService;

  Future<AppResponse> getSearch(String search) => apiService.search(search);
}
