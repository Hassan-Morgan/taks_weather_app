import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taqs/core/constants/api_end_points.dart';
import 'package:taqs/core/errors/exceptions.dart';
import 'package:taqs/features/weather_forecast/data/data_sources/remote_data_source.dart';
import 'package:taqs/features/weather_forecast/data/data_sources/weather_forecast_retrofit/weather_forecast_retrofit.dart';
import 'package:dio/dio.dart';
import '../../../../dio_error_test_model.dart';
import '../models_test/test_model.dart';
import 'remote_data_source_test.mocks.dart';

@GenerateMocks([WeatherForecastRetrofit])
void main() {
  late WeatherForecastDataSource weatherForecastDataSourceImpl;
  late MockWeatherForecastRetrofit retrofit;

  setUp(() {
    retrofit = MockWeatherForecastRetrofit();
    weatherForecastDataSourceImpl = WeatherForecastDataSourceImpl(retrofit);
  });

  final dioError = DioError(
    error: TestErrorModel(1),
    requestOptions: RequestOptions(
      path: SEARCH,
    ),
  );

  test(
      '''should return WeatherForecastModel when call the function and no errors happen 
    and call the getWeatherForecastWithLocation from retrofit''', () async {
    when(retrofit.getWeatherForecast(any, any, any))
        .thenAnswer((realInvocation) async => testModel);

    final result =
        await weatherForecastDataSourceImpl.getWeatherForecast('test');

    expect(result, Right(testModel));
    verify(retrofit.getWeatherForecast(API_KEY, 'test', 10));
  });

  test('''should return Exception when call the function and errors happen 
    and call the getWeatherForecastWithLocation from retrofit''', () async {
    when(retrofit.getWeatherForecast(any, any, any)).thenThrow(dioError);

    final result =
        await weatherForecastDataSourceImpl.getWeatherForecast('test');

    expect(result, const Left(ServerException()));
    verify(retrofit.getWeatherForecast(API_KEY, 'test', 10));
  });
}
