import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_forecast_model.g.dart';

@JsonSerializable()
class WeatherForecastModel extends Equatable {
  const WeatherForecastModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

   final Location location;
   final Current current;
   final Forecast forecast;

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastModelToJson(this);

  @override
  List<Object?> get props => [current, forecast, location];
}

@JsonSerializable()
class Location extends Equatable {
  const Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tz_id,
    required this.localtime_epoch,
    required this.localtime,
  });

   final String name;
   final String region;
   final String country;
   final double lat;
   final double lon;
   final String tz_id;
   final int localtime_epoch;
   final String localtime;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  List<Object?> get props =>
      [name, region, country, lat, lon, tz_id, localtime, localtime_epoch];
}

@JsonSerializable()
class Current extends Equatable {
  const Current({
    required this.cloud,
    required this.condition,
    required this.feelslike_c,
    required this.feelslike_f,
    required this.gust_kph,
    required this.gust_mph,
    required this.humidity,
    required this.is_day,
    required this.last_updated,
    required this.last_updated_epoch,
    required this.precip_in,
    required this.precip_mm,
    required this.pressure_in,
    required this.pressure_mb,
    required this.temp_c,
    required this.temp_f,
    required this.uv,
    required this.vis_km,
    required this.vis_miles,
    required this.wind_degree,
    required this.wind_dir,
    required this.wind_kph,
    required this.wind_mph,
  });

   final int last_updated_epoch;
   final String last_updated;
   final double temp_c;
   final double temp_f;
   final int is_day;
   final Condition condition;
   final double wind_mph;
   final double wind_kph;
   final int wind_degree;
   final String wind_dir;
   final double pressure_mb;
   final double pressure_in;
   final double precip_mm;
   final double precip_in;
   final int humidity;
   final int cloud;
   final double feelslike_c;
   final double feelslike_f;
   final double vis_km;
   final double vis_miles;
   final double uv;
   final double gust_mph;
   final double gust_kph;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);

  @override
  List<Object?> get props => [
        cloud,
        condition,
        feelslike_c,
        feelslike_f,
        gust_kph,
        gust_mph,
        humidity,
        is_day,
        last_updated,
        last_updated_epoch,
        precip_in,
        precip_mm,
        pressure_in,
        pressure_mb,
        temp_c,
        temp_f,
        uv,
        vis_km,
        vis_miles,
        wind_degree,
        wind_dir,
        wind_kph,
        wind_mph,
      ];
}

@JsonSerializable()
class Condition extends Equatable {
  const Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

   final String text;
   final String icon;
   final int code;

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);

  @override
  List<Object?> get props => [text, icon, code];
}

@JsonSerializable()
class Forecast extends Equatable {
  const Forecast({
    required this.forecastday,
  });

   final List<Forecastday> forecastday;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);

  @override
  List<Object?> get props => [forecastday];
}

@JsonSerializable()
class Forecastday extends Equatable {
  const Forecastday({
    required this.date,
    required this.date_epoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

   final String date;
   final int date_epoch;
   final Day day;
   final Astro astro;
   final List<Hour> hour;

  factory Forecastday.fromJson(Map<String, dynamic> json) =>
      _$ForecastdayFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastdayToJson(this);

  @override
  List<Object?> get props => [date, date_epoch, day, astro, hour];
}

@JsonSerializable()
class Day extends Equatable {
  const Day({
    required this.uv,
    required this.avghumidity,
    required this.condition,
    required this.totalprecip_in,
    required this.avgtemp_c,
    required this.avgtemp_f,
    required this.avgvis_km,
    required this.avgvis_miles,
    required this.daily_chance_of_rain,
    required this.daily_chance_of_snow,
    required this.daily_will_it_rain,
    required this.daily_will_it_snow,
    required this.maxtemp_c,
    required this.maxtemp_f,
    required this.maxwind_kph,
    required this.maxwind_mph,
    required this.mintemp_c,
    required this.mintemp_f,
    required this.totalprecip_mm,
  });

   final double maxtemp_c;
   final double maxtemp_f;
   final double mintemp_c;
   final double mintemp_f;
   final double avgtemp_c;
   final double avgtemp_f;
   final double? maxwind_mph;
   final double maxwind_kph;
   final double totalprecip_mm;
   final double totalprecip_in;
   final double avgvis_km;
   final double avgvis_miles;
   final double avghumidity;
   final int daily_will_it_rain;
   final int daily_chance_of_rain;
   final int daily_will_it_snow;
   final int daily_chance_of_snow;
   final Condition condition;
   final double uv;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);

  @override
  List<Object?> get props => [
        uv,
        avghumidity,
        condition,
        totalprecip_in,
        avgtemp_c,
        avgtemp_f,
        avgvis_km,
        avgvis_miles,
        daily_chance_of_rain,
        daily_chance_of_snow,
        daily_will_it_rain,
        daily_will_it_snow,
        maxtemp_c,
        maxtemp_f,
        maxwind_kph,
        maxwind_mph,
        mintemp_c,
        mintemp_f,
        totalprecip_mm,
      ];
}

@JsonSerializable()
class Astro extends Equatable {
  const Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moon_illumination,
    required this.moon_phase,
  });

   final String sunrise;
   final String sunset;
   final String moonrise;
   final String moonset;
   final String moon_phase;
   final String moon_illumination;

  factory Astro.fromJson(Map<String, dynamic> json) => _$AstroFromJson(json);

  Map<String, dynamic> toJson() => _$AstroToJson(this);

  @override
  List<Object?> get props =>
      [sunrise, sunset, moonrise, moonset, moon_phase, moon_illumination];
}

@JsonSerializable()
class Hour extends Equatable {
  const Hour({
    required this.uv,
    required this.wind_mph,
    required this.wind_kph,
    required this.wind_dir,
    required this.wind_degree,
    required this.vis_miles,
    required this.vis_km,
    required this.temp_f,
    required this.temp_c,
    required this.pressure_mb,
    required this.pressure_in,
    required this.precip_mm,
    required this.is_day,
    required this.precip_in,
    required this.humidity,
    required this.gust_mph,
    required this.gust_kph,
    required this.feelslike_f,
    required this.feelslike_c,
    required this.condition,
    required this.cloud,
    required this.chance_of_rain,
    required this.chance_of_snow,
    required this.dewpoint_c,
    required this.dewpoint_f,
    required this.heatindex_c,
    required this.heatindex_f,
    required this.time,
    required this.time_epoch,
    required this.will_it_rain,
    required this.will_it_snow,
    required this.windchill_c,
    required this.windchill_f,
  });

   final int time_epoch;
   final String time;
   final double? temp_c;
   final double? temp_f;
   final int is_day;
   final Condition condition;
   final double? wind_mph;
   final double? wind_kph;
   final int wind_degree;
   final String wind_dir;
   final double pressure_mb;
   final double? pressure_in;
   final double precip_mm;
   final double precip_in;
   final int humidity;
   final int cloud;
   final double? feelslike_c;
   final double? feelslike_f;
   final double? windchill_c;
   final double? windchill_f;
   final double? heatindex_c;
   final double? heatindex_f;
   final double? dewpoint_c;
   final double? dewpoint_f;
   final int will_it_rain;
   final int chance_of_rain;
   final int will_it_snow;
   final int chance_of_snow;
   final double vis_km;
   final double vis_miles;
   final double? gust_mph;
   final double? gust_kph;
   final double uv;

  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);

  Map<String, dynamic> toJson() => _$HourToJson(this);

  @override
  List<Object?> get props => [
        time_epoch,
        time,
        temp_c,
        temp_f,
        is_day,
        condition,
        wind_mph,
        wind_kph,
        wind_degree,
        wind_dir,
        pressure_mb,
        pressure_in,
        precip_mm,
        precip_in,
        humidity,
        cloud,
        feelslike_c,
        feelslike_f,
        windchill_c,
        windchill_f,
        heatindex_c,
        heatindex_f,
        dewpoint_c,
        dewpoint_f,
        will_it_rain,
        chance_of_rain,
        will_it_snow,
        chance_of_snow,
        vis_km,
        vis_miles,
        gust_mph,
        gust_kph,
        uv,
      ];
}
