import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taqs/features/weather_forecast/domain/entities/weather_entity.dart';

part 'search_weather_states.freezed.dart';

@Freezed()
class SearchWeatherStates with _$SearchWeatherStates {
  factory SearchWeatherStates.loading() = _loading;

  factory SearchWeatherStates.error(String error) = _error;

  factory SearchWeatherStates.success(WeatherEntity entity) = _success;
}
