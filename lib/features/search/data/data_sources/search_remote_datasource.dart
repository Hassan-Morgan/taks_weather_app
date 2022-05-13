import 'package:dartz/dartz.dart';
import 'package:taqs/core/constants/api_end_points.dart';
import 'package:taqs/core/errors/exceptions.dart';
import 'package:taqs/features/search/data/data_sources/search_retrofit/search_retrofit.dart';
import 'package:dio/dio.dart';
import '../models/search_model.dart';

abstract class SearchRemoteDatasource {
  Future<Either<Exception, List<SearchModel>>> search(String q);
}

class SearchRemoteDatasourceImpl extends SearchRemoteDatasource {
  final SearchRetrofit retrofit;

  SearchRemoteDatasourceImpl(this.retrofit);

  @override
  Future<Either<Exception, List<SearchModel>>> search(String q) async {
    try {
      return Right(await retrofit.getSearch(API_KEY, q));
    } on DioError catch (e) {
      return Left(ServerException(e.error.code));
    }
  }
}
