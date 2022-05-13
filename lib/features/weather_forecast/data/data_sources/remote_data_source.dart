import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:taqs/core/errors/exceptions.dart';
import 'package:taqs/features/weather_forecast/data/data_sources/weather_forecast_retrofit/weather_forecast_retrofit.dart';
import 'package:taqs/features/weather_forecast/data/models/weather_forecast_model.dart';

import '../../../../core/constants/api_end_points.dart';

abstract class WeatherForecastDataSource {
  Future<Either<Exception, WeatherForecastModel>> getWeatherForecast(String q);
}

class WeatherForecastDataSourceImpl extends WeatherForecastDataSource {
  final WeatherForecastRetrofit retrofit;

  WeatherForecastDataSourceImpl(this.retrofit);

  @override
  Future<Either<Exception, WeatherForecastModel>> getWeatherForecast(
      String q) async {
    try {
      final result = await retrofit.getWeatherForecast(API_KEY, q, 10);
      return Right(result);
    } on DioError catch (e) {
      return Left(ServerException(e.error.code));
    }
  }
}
