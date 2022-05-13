import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:taqs/features/search/data/models/search_model.dart';
import '../../../../../core/constants/api_end_points.dart';

part 'search_retrofit.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class SearchRetrofit {
  factory SearchRetrofit(Dio dio, {String baseUrl}) = _SearchRetrofit;

  @GET(SEARCH)
  Future<List<SearchModel>> getSearch(
    @Query("key") String apiKey,
    @Query("q") String q,
  );
}
