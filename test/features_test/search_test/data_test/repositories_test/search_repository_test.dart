import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taqs/core/errors/exceptions.dart';
import 'package:taqs/core/errors/failures.dart';
import 'package:taqs/core/utils/network_info/network_info.dart';
import 'package:taqs/features/search/data/data_sources/search_remote_datasource.dart';
import 'package:taqs/features/search/data/models/search_model.dart';
import 'package:taqs/features/search/data/repositories/search_repository.dart';
import 'package:taqs/features/search/domain/entities/search_entity.dart';
import 'package:taqs/features/search/domain/entities/search_entity_list.dart';
import 'package:taqs/features/search/domain/repositories/search_repository.dart';

import 'search_repository_test.mocks.dart';

@GenerateMocks([SearchRemoteDatasource, NetworkInfo])
void main() {
  late MockSearchRemoteDatasource datasource;
  late MockNetworkInfo networkInfo;
  late SearchRepository searchRepository;

  setUp(
    () {
      datasource = MockSearchRemoteDatasource();
      networkInfo = MockNetworkInfo();
      searchRepository = SearchRepositoryImpl(
        datasource: datasource,
        networkInfo: networkInfo,
      );
    },
  );

  const List<SearchModel> testModel = [
    SearchModel(
      id: 1,
      name: 'testName',
      region: 'testRegion',
      country: 'testCountry',
      lat: 1.0,
      lon: 1.0,
      url: 'testURL',
    )
  ];

  const SearchEntityList testEntity = SearchEntityList(
    [
      SearchEntity(
        name: 'testName',
        region: 'testRegion',
        country: 'testCountry',
      )
    ],
  );

  group(
    'networkConnection is true',
    () {
      setUp(() {
        when(networkInfo.getCurrentConnectionState)
            .thenAnswer((realInvocation) async => true);
      });

      test(
        'should return List<SearchModel> when call search function and no errors happen',
        () async {
          when(datasource.search(any))
              .thenAnswer((realInvocation) async => const Right(testModel));
          final result = await searchRepository.search('test');
          verify(networkInfo.getCurrentConnectionState);
          verify(datasource.search('test'));
          expect(result, const Right(testEntity));
        },
      );

      test(
          'should return ServerFailure when call the search function and server error happen',
          () async {
        when(datasource.search(any)).thenAnswer(
            (realInvocation) async => const Left(ServerException()));
        final result = await searchRepository.search('test');
        verify(datasource.search('test'));
        verify(networkInfo.getCurrentConnectionState);
        expect(
            result,
            const Left(ServerFailure(
                'Server Failure happened \n please try again later')));
      });
    },
  );

  group('networkConnection is false', () {
    setUp(() {
      when(networkInfo.getCurrentConnectionState)
          .thenAnswer((realInvocation) async => false);
    });

    test('should return networkFailure when call the function', () async {
      final result = await searchRepository.search('test');
      verifyZeroInteractions(datasource);
      verify(networkInfo.getCurrentConnectionState);
      expect(
          result,
          const Left(NetworkFailure(
              'Network error happened \n please check your internet connection')));
    });
  });
}
