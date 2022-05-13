import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taqs/core/constants/api_end_points.dart';
import 'package:dio/dio.dart';
import 'package:taqs/core/errors/exceptions.dart';
import 'package:taqs/features/search/data/data_sources/search_remote_datasource.dart';
import 'package:taqs/features/search/data/data_sources/search_retrofit/search_retrofit.dart';
import 'package:taqs/features/search/data/models/search_model.dart';

import '../../../../dio_error_test_model.dart';
import 'remote_data_source_test.mocks.dart';

@GenerateMocks([SearchRetrofit])
void main() {
  late MockSearchRetrofit retrofit;
  late SearchRemoteDatasource searchDataSource;

  setUp(() {
    retrofit = MockSearchRetrofit();
    searchDataSource = SearchRemoteDatasourceImpl(retrofit);
  });

  const List<SearchModel> testList = [
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

  test(
    'should return List<SearchModel> when call the search function and no errors happen',
    () async {
      when(retrofit.getSearch(any, any))
          .thenAnswer((realInvocation) async => testList);
      final result = await searchDataSource.search('test');
      verify(retrofit.getSearch(API_KEY, 'test'));
      expect(result, const Right(testList));
    },
  );

  final dioError = DioError(
    error: TestErrorModel(1),
    requestOptions: RequestOptions(
      path: SEARCH,
    ),
  );

  test(
    'should return Exception when call the search function and throws dio error',
    () async {
      when(retrofit.getSearch(any, any)).thenThrow(dioError);
      final result = await searchDataSource.search('test');
      verify(retrofit.getSearch(API_KEY, 'test'));
      expect(result, const Left(ServerException(1)));
    },
  );
}
