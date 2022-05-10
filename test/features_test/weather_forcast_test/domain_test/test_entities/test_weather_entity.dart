import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/astro_enitity.dart';
import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/current_weather_entity.dart';
import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/day_weather_entity.dart';
import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/forecast_entity.dart';
import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/hourly_weather_entity.dart';
import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/location_entity.dart';
import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/weather_condition_entity.dart';
import 'package:taqs/features/weather_forecast/domain/entities/weather_entity.dart';

WeatherEntity testWeatherEntity = WeatherEntity(
    location: testLocation,
    current: testCurrentWeather,
    forecast: [testForecastDayEntity]);

LocationEntity testLocation = const LocationEntity(
    name: 'test name', country: 'test country', localtime: 'test time');

CurrentWeatherEntity testCurrentWeather = CurrentWeatherEntity(
  lastUpdated: 'test time',
  tempC: 1.0,
  tempF: 1.0,
  isDay: 1,
  condition: testWeatherCondition,
  windMph: 1.0,
  windKph: 1.0,
  windDegree: 1,
  windDir: 'test dir',
  pressureMb: 1.0,
  pressureIn: 1.0,
  humidity: 1,
  cloud: 1,
  feelsLikeC: 1.0,
  feelsLikeF: 1.0,
  visKm: 1.0,
  visMiles: 1.0,
  uv: 1.0,
  gustMph: 1.0,
  gustKph: 1.0,
);
WeatherConditionEntity testWeatherCondition =
    const WeatherConditionEntity(text: 'test condition', icon: 'test icon',);

ForecastDayEntity testForecastDayEntity = ForecastDayEntity(
  date: 'test date',
  day: testDayEntity,
  astro: testAstroEntity,
  hour: [testHourEntity],
);

DayEntity testDayEntity = DayEntity(
  maxTempC: 1.0,
  maxTempF: 1.0,
  minTempC: 1.0,
  minTempF: 1.0,
  maxWindMph: 1.0,
  maxWindKph: 1.0,
  avgVisKm: 1.0,
  avgVisMiles: 1.0,
  avgHumidity: 1.0,
  dailyChanceOfRain: 1,
  dailyChanceOfSnow: 1,
  condition: testWeatherCondition,
  uv: 1,
);

AstroEntity testAstroEntity = const AstroEntity(
  sunrise: 'test time',
  sunset: 'test time',
  moonrise: 'test time',
  moonSet: 'test time',
  moonPhase: "test moonPhase",
  moonIllumination: "test illumination",
);

HourlyWeatherEntity testHourEntity = HourlyWeatherEntity(
  time: 'test time',
  tempC: 1.0,
  tempF: 1.0,
  isDay: 1,
  condition: testWeatherCondition,
  windMph: 1.0,
  windKph: 1.0,
  windDegree: 1,
  windDir: 'test direction',
  pressureMb: 1.0,
  pressureIn: 1.0,
  humidity: 1,
  cloud: 1,
  feelsLikeC: 1.0,
  feelsLikeF: 1.0,
  windchillC: 1.0,
  windchillF: 1.0,
  heatIndexC: 1.0,
  heatIndexF: 1.0,
  dewPointC: 1.0,
  dewPointF: 1.0,
  chanceOfRain: 1,
  chanceOfSnow: 1,
  visKm: 1.0,
  visMiles: 1.0,
  gustMph: 1.0,
  gustKph: 1.0,
  uv: 1.0,
);
