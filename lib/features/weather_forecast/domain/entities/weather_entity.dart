import 'package:equatable/equatable.dart';

import 'sub_entities/current_weather_entity.dart';
import 'sub_entities/forecast_entity.dart';
import 'sub_entities/location_entity.dart';

class WeatherEntity extends Equatable {
  const WeatherEntity({
    required this.location,
    required this.current,
    required this.forecast,
  });

  final LocationEntity location;
  final CurrentWeatherEntity current;
  final List<ForecastDayEntity> forecast;

  @override
  List<Object?> get props => [location, current, forecast];
}
