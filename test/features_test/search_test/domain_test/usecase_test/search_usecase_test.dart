import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taqs/core/errors/failures.dart';
import 'package:taqs/features/search/domain/entities/search_entity.dart';
import 'package:taqs/features/search/domain/entities/search_entity_list.dart';
import 'package:taqs/features/search/domain/repositories/search_repository.dart';
import 'package:taqs/features/search/domain/usecases/search_usecase.dart';

import 'search_usecase_test.mocks.dart';

@GenerateMocks([SearchRepository])
void main() {
  late MockSearchRepository repository;
  late SearchUsecase usecase;

  setUp(() {
    repository = MockSearchRepository();
    usecase = SearchUsecase(repository);
  });

  SearchEntityList entity = const SearchEntityList(
    [
      SearchEntity(
          name: 'testName', country: 'testCountry', region: 'testRegion'),
    ],
  );

  test(
      'should return searchEntity when call search function and no failure happen',
      () async {
    when(repository.search(any))
        .thenAnswer((realInvocation) async => Right(entity));
    final result = await usecase(const SearchParams('test'));
    verify(repository.search('test'));
    expect(result, Right(entity));
  });

  test('should return failure when call search function and failure happen',
      () async {
    when(repository.search(any)).thenAnswer(
        (realInvocation) async => const Left(ServerFailure('test message')));

    final result = await usecase(const SearchParams('test'));
    expect(result, const Left(ServerFailure('test message')));
    verify(repository.search('test'));
  });
}
