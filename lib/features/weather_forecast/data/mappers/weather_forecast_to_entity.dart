import 'package:taqs/features/weather_forecast/data/models/weather_forecast_model.dart';
import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/astro_enitity.dart';
import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/current_weather_entity.dart';
import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/day_weather_entity.dart';
import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/forecast_entity.dart';
import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/hourly_weather_entity.dart';
import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/location_entity.dart';
import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/weather_condition_entity.dart';
import 'package:taqs/features/weather_forecast/domain/entities/weather_entity.dart';

extension WeatherForecastToEntity on WeatherForecastModel {
  WeatherEntity toEntity() {
    return WeatherEntity(
      location: LocationEntity(
          country: location.country,
          localtime: location.localtime,
          name: location.name),
      current: CurrentWeatherEntity(
        windKph: current.wind_kph,
        windDegree: current.wind_degree,
        windDir: current.wind_dir,
        visMiles: current.vis_miles,
        visKm: current.vis_km,
        uv: current.uv,
        tempF: current.temp_f,
        tempC: current.temp_c,
        pressureMb: current.pressure_mb,
        pressureIn: current.pressure_in,
        isDay: current.is_day,
        feelsLikeF: current.feelslike_f,
        feelsLikeC: current.feelslike_c,
        condition: WeatherConditionEntity(
          text: current.condition.text,
          icon: current.condition.icon,
        ),
        cloud: current.cloud,
        gustKph: current.gust_kph,
        gustMph: current.gust_mph,
        humidity: current.humidity,
        lastUpdated: current.last_updated,
        windMph: current.wind_mph,
      ),
      forecast: forecast.forecastday
          .map(
            (e) => ForecastDayEntity(
                date: e.date,
                day: DayEntity(
                  condition: WeatherConditionEntity(
                    icon: e.day.condition.icon,
                    text: e.day.condition.text,
                  ),
                  uv: e.day.uv,
                  avgTempC: e.day.avgtemp_c,
                  avgTempF: e.day.avgtemp_f,
                  avgHumidity: e.day.avghumidity,
                  avgVisKm: e.day.avgvis_km,
                  avgVisMiles: e.day.avgvis_miles,
                  dailyChanceOfRain: e.day.daily_chance_of_rain,
                  dailyChanceOfSnow: e.day.daily_chance_of_snow,
                  maxTempC: e.day.maxtemp_c,
                  maxTempF: e.day.maxtemp_f,
                  maxWindKph: e.day.maxwind_kph,
                  maxWindMph: e.day.maxwind_mph,
                  minTempC: e.day.mintemp_c,
                  minTempF: e.day.mintemp_f,
                ),
                astro: AstroEntity(
                  moonIllumination: e.astro.moon_illumination,
                  moonPhase: e.astro.moon_phase,
                  moonrise: e.astro.moonrise,
                  moonSet: e.astro.moonset,
                  sunrise: e.astro.sunrise,
                  sunset: e.astro.sunset,
                ),
                hour: e.hour
                    .map(
                      (e) => HourlyWeatherEntity(
                        time: e.time,
                        tempC: e.temp_c,
                        tempF: e.temp_f,
                        isDay: e.is_day,
                        condition: WeatherConditionEntity(
                          text: e.condition.text,
                          icon: e.condition.icon,
                        ),
                        windMph: e.wind_mph,
                        windKph: e.wind_kph,
                        windDegree: e.wind_degree,
                        windDir: e.wind_dir,
                        pressureMb: e.pressure_mb,
                        pressureIn: e.pressure_in!,
                        humidity: e.humidity,
                        cloud: e.cloud,
                        feelsLikeC: e.feelslike_c,
                        feelsLikeF: e.feelslike_f,
                        windchillC: e.windchill_c,
                        windchillF: e.windchill_f,
                        heatIndexC: e.heatindex_c,
                        heatIndexF: e.heatindex_f,
                        dewPointC: e.dewpoint_c,
                        dewPointF: e.dewpoint_f,
                        chanceOfRain: e.chance_of_rain,
                        chanceOfSnow: e.chance_of_snow,
                        visKm: e.vis_km,
                        visMiles: e.vis_miles,
                        gustMph: e.gust_mph,
                        gustKph: e.gust_kph,
                        uv: e.uv,
                      ),
                    )
                    .toList()),
          )
          .toList(),
    );
  }
}
