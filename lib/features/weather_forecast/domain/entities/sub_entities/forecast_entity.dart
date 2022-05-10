import 'package:equatable/equatable.dart';

import 'astro_enitity.dart';
import 'day_weather_entity.dart';
import 'hourly_weather_entity.dart';

class ForecastDayEntity extends Equatable {
  const ForecastDayEntity({
    required this.date,
    required this.day,
    required this.astro,
    required this.hour,
  });

  final String date;
  final DayEntity day;
  final AstroEntity astro;
  final List<HourlyWeatherEntity> hour;

  @override
  List<Object?> get props => [
        date,
        day,
        astro,
        hour,
      ];
}
