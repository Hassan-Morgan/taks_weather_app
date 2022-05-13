import 'package:equatable/equatable.dart';

import '../../../../weather_forecast/domain/entities/sub_entities/weather_condition_entity.dart';

class DayEntity extends Equatable {
  const DayEntity({
    required this.maxTempC,
    required this.maxTempF,
    required this.avgTempF,
    required this.avgTempC,
    required this.minTempC,
    required this.minTempF,
    required this.maxWindMph,
    required this.maxWindKph,
    required this.avgVisKm,
    required this.avgVisMiles,
    required this.avgHumidity,
    required this.dailyChanceOfRain,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  final double? maxTempC;
  final double maxTempF;
  final double? minTempC;
  final double? minTempF;
  final double? avgTempC;
  final double? avgTempF;
  final double? maxWindMph;
  final double maxWindKph;
  final double avgVisKm;
  final double avgVisMiles;
  final double avgHumidity;
  final int dailyChanceOfRain;
  final int dailyChanceOfSnow;
  final WeatherConditionEntity condition;
  final double uv;

  @override
  List<Object?> get props => [
        maxTempC,
        maxTempF,
        minTempC,
        minTempF,
        maxWindMph,
        maxWindKph,
        avgVisKm,
        avgVisMiles,
        avgHumidity,
        dailyChanceOfRain,
        dailyChanceOfSnow,
        condition,
        uv,
      ];
}
