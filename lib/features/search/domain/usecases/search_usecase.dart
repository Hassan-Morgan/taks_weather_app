import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:taqs/core/errors/failures.dart';
import 'package:taqs/core/use_cases/use_case.dart';
import 'package:taqs/features/search/domain/entities/search_entity_list.dart';
import 'package:taqs/features/search/domain/repositories/search_repository.dart';

class SearchUsecase extends UseCase<SearchEntityList, SearchParams> {
  final SearchRepository repository;

  SearchUsecase(this.repository);

  @override
  Future<Either<Failure, SearchEntityList>> call(SearchParams params) async {
    return await repository.search(params.q);
  }
}

class SearchParams extends Equatable {
  final String q;

  const SearchParams(this.q);

  @override
  List<Object?> get props => [q];
}
