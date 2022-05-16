import 'package:dartz/dartz.dart';
import 'package:taqs/core/errors/exceptions.dart';
import 'package:taqs/core/errors/failures.dart';
import 'package:taqs/features/search/data/data_sources/search_remote_datasource.dart';
import 'package:taqs/features/search/data/mappers/search_model_to_entity_mapper.dart';
import 'package:taqs/features/search/data/models/search_model.dart';
import 'package:taqs/features/search/domain/entities/search_entity_list.dart';
import 'package:taqs/features/search/domain/repositories/search_repository.dart';

import '../../../../core/utils/network_info/network_info.dart';

class SearchRepositoryImpl extends SearchRepository {
  SearchRemoteDatasource datasource;
  NetworkInfo networkInfo;

  SearchRepositoryImpl({
    required this.datasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, SearchEntityList>> search(String q) async {
    if (await networkInfo.getCurrentConnectionState) {
      final result = await datasource.search(q);
      return result.fold((Exception exception) {
        return const Left(
            ServerFailure('Server Failure happened \n please try again later'));
      }, (List<SearchModel> model) {
        SearchEntityList searchEntity =
            SearchEntityList(model.map((e) => e.toEntity()).toList());
        return Right(searchEntity);
      });
    } else {
      return const Left(NetworkFailure(
          'Network error happened \n please check your internet connection'));
    }
  }
}
