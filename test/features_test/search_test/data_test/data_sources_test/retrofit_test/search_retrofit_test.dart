import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:taqs/core/constants/api_end_points.dart';
import 'package:taqs/features/search/data/data_sources/search_retrofit/search_retrofit.dart';
import 'package:taqs/features/search/data/models/search_model.dart';

import '../../../../../fixtures/fixtures_reader.dart';
import '../../../../weather_forcast_test/data_test/data_source_test/retrofit_test/retrofit_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio dio;
  late SearchRetrofit searchRetrofit;

  setUp(() {
    dio = MockDio();
    searchRetrofit = SearchRetrofit(dio);
  });

  final List<Map<String, dynamic>> jsonResponse = [
    json.decode(fixtureReader('search_response.json'))
  ];

  final testResponse = Response(
    requestOptions: RequestOptions(
      path: SEARCH,
    ),
    data: jsonResponse,
    statusCode: 200,
  );

  final dioError = DioError(
    requestOptions: RequestOptions(
      path: SEARCH,
    ),
  );

  const SearchModel testModel = SearchModel(
    id: 1,
    name: 'testName',
    region: 'testRegion',
    country: 'testCountry',
    lat: 1.0,
    lon: 1.0,
    url: 'testURL',
  );

  test(
      'should return List<SearchModel> when call the getSearch function and no errors happen',
      () async {
    when(dio.fetch(any)).thenAnswer((realInvocation) async => testResponse);
    when(dio.options).thenReturn(BaseOptions());

    final result = await searchRetrofit.getSearch(API_KEY, 'test');

    expect(result, [testModel]);
  });

  test('should throw dioError when call the getSearch and error happen',
      () async {
    when(dio.fetch(any)).thenThrow(dioError);
    when(dio.options).thenReturn(BaseOptions());

    final result = searchRetrofit.getSearch;

    expect(() async => await result(API_KEY, 'test'),
        throwsA(const TypeMatcher<DioError>()));
  });
}
