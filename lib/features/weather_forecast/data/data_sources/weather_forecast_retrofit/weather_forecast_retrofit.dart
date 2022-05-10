import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:taqs/features/weather_forecast/data/models/weather_forecast_model.dart';

import '../../../../../core/constants/api_end_points.dart';

part 'weather_forecast_retrofit.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class WeatherForecastRetrofit {
  factory WeatherForecastRetrofit(Dio dio, {String baseUrl}) =
      _WeatherForecastRetrofit;

  @GET(WEATHER_FORECAST)
  Future<WeatherForecastModel> getWeatherForecast(
    @Query("key") String apiKey,
    @Query("q") String q,
    @Query("days") int days,
  );
}
