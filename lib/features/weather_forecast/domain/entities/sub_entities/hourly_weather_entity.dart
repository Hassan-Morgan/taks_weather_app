import 'package:equatable/equatable.dart';

import '../../../../weather_forecast/domain/entities/sub_entities/weather_condition_entity.dart';

class HourlyWeatherEntity extends Equatable {
  const HourlyWeatherEntity({
    required this.time,
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
    required this.windchillC,
    required this.windchillF,
    required this.heatIndexC,
    required this.heatIndexF,
    required this.dewPointC,
    required this.dewPointF,
    required this.chanceOfRain,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
  });

  final String time;
  final double? tempC;
  final double? tempF;
  final int isDay;
  final WeatherConditionEntity condition;
  final double? windMph;
  final double? windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final int humidity;
  final int cloud;
  final double? feelsLikeC;
  final double? feelsLikeF;
  final double? windchillC;
  final double? windchillF;
  final double? heatIndexC;
  final double? heatIndexF;
  final double? dewPointC;
  final double? dewPointF;
  final int chanceOfRain;
  final int chanceOfSnow;
  final double visKm;
  final double visMiles;
  final double? gustMph;
  final double? gustKph;
  final double uv;

  @override
  List<Object?> get props => [
        time,
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
        windchillC,
        windchillF,
        heatIndexC,
        heatIndexF,
        dewPointC,
        dewPointF,
        chanceOfRain,
        chanceOfSnow,
        visKm,
        visMiles,
        gustMph,
        gustKph,
        uv,
      ];
}
