import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taqs/features/weather_forecast/domain/entities/weather_entity.dart';

part 'weather_forecast_states.freezed.dart';

@Freezed()
class WeatherForecastStates with _$WeatherForecastStates {
  factory WeatherForecastStates.loading() = _loading;

  factory WeatherForecastStates.error(String error) = _error;

  factory WeatherForecastStates.success(WeatherEntity entity) = _success;
}
