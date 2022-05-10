import 'package:equatable/equatable.dart';

import '../../../../weather_forecast/domain/entities/sub_entities/weather_condition_entity.dart';

class CurrentWeatherEntity extends Equatable {
  const CurrentWeatherEntity({
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.humidity,
    required this.cloud,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  final String lastUpdated;
  final double tempC;
  final double tempF;
  final int isDay;
  final WeatherConditionEntity condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final int humidity;
  final int cloud;
  final double feelsLikeC;
  final double feelsLikeF;
  final double visKm;
  final double visMiles;
  final double uv;
  final double gustMph;
  final double gustKph;

  @override
  List<Object?> get props => [
        lastUpdated,
        tempC,
        tempF,
        isDay,
        condition,
        windMph,
        windKph,
        windDegree,
        windDir,
        pressureMb,
        pressureIn,
        humidity,
        cloud,
        feelsLikeC,
        feelsLikeF,
        visKm,
        visMiles,
        uv,
        gustMph,
        gustKph,
      ];
}
