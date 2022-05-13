import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import 'package:taqs/core/errors/failures.dart';

import '../entities/weather_entity.dart';

abstract class WeatherForecastRepository {
  Future<Either<Failure, WeatherEntity>> getWeatherForecast(String q);
}
