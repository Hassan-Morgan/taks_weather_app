import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taqs/core/constants/api_end_points.dart';
import 'package:dio/dio.dart';
import 'package:taqs/core/constants/app_constants.dart';
import 'package:taqs/core/errors/exceptions.dart';
import 'package:taqs/features/weather_forecast/data/data_sources/weather_forecast_retrofit/weather_forecast_retrofit.dart';

import '../../../../../fixtures/fixtures_reader.dart';
import '../../models_test/test_model.dart';
import 'retrofit_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late WeatherForecastRetrofit retrofit;
  late MockDio dio;

  setUp(() {
    dio = MockDio();
    retrofit = WeatherForecastRetrofit(dio);
  });
  final Map<String, dynamic> noErrorJsonResponse =
      jsonDecode(fixtureReader('weather_forecast_double_response.json'));
  final testResponse = Response(
    requestOptions: RequestOptions(
      path: WEATHER_FORECAST,
    ),
    data: noErrorJsonResponse,
    statusCode: 200,
  );


  final dioError = DioError(
    requestOptions: RequestOptions(
      path: WEATHER_FORECAST,
    ),
  );

  test(
      'should return the WeatherForecastModel when call getWeatherForecast and response with code 200',
      () async {
    when(dio.fetch(any)).thenAnswer((realInvocation) async => testResponse);
    when(dio.options).thenReturn(BaseOptions());
    final result = await retrofit.getWeatherForecast(API_KEY, 'test', 10);
    expect(result, testModel);
  });

  test(
      'should throw DioError when call getWeatherForecast and response with code not 200',
      () async {
    when(dio.fetch(any))
        .thenThrow(dioError);
    when(dio.options).thenReturn(BaseOptions());
    final result = retrofit.getWeatherForecast;
    expect(() async => await result(API_KEY, 'test', 10),
        throwsA(const TypeMatcher<DioError>()));
  });


}
