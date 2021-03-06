import 'package:taqs/features/weather_forecast/data/models/weather_forecast_model.dart';

WeatherForecastModel testModel = WeatherForecastModel(
    location: testLocation, current: testCurrent, forecast: testForecast);

Location testLocation = Location(
  name: "test name",
  region: "test region",
  country: "test country",
  lat: 1.0,
  lon: 1.0,
  tz_id: "test id",
  localtime_epoch: 1,
  localtime: "test time",
);

Current testCurrent = Current(
  last_updated_epoch: 1,
  last_updated: "test time",
  temp_c: 1.0,
  temp_f: 1.0,
  is_day: 1,
  condition: testCondition,
  wind_mph: 1.0,
  wind_kph: 1.0,
  wind_degree: 1,
  wind_dir: "test dir",
  pressure_mb: 1.0,
  pressure_in: 1.0,
  precip_mm: 1.0,
  precip_in: 1.0,
  humidity: 1,
  cloud: 1,
  feelslike_c: 1.0,
  feelslike_f: 1.0,
  vis_km: 1.0,
  vis_miles: 1.0,
  uv: 1.0,
  gust_mph: 1.0,
  gust_kph: 1.0,
);

Condition testCondition = Condition(
  text: "test condition",
  icon: "test icon",
  code: 1,
);

Forecast testForecast = Forecast(forecastday: [testForecastDay]);

Forecastday testForecastDay = Forecastday(
  date: "test date",
  date_epoch: 1,
  day: testDay,
  astro: testAstro,
  hour:[testHour],
);

Day testDay = Day(
  maxtemp_c: 1.0,
  maxtemp_f: 1.0,
  mintemp_c: 1.0,
  mintemp_f: 1.0,
  avgtemp_c: 1.0,
  avgtemp_f: 1.0,
  maxwind_mph: 1.0,
  maxwind_kph: 1.0,
  totalprecip_mm: 1.0,
  totalprecip_in: 1.0,
  avgvis_km: 1.0,
  avgvis_miles: 1.0,
  avghumidity: 1.0,
  daily_will_it_rain: 1,
  daily_chance_of_rain: 1,
  daily_will_it_snow: 1,
  daily_chance_of_snow: 1,
  condition: testCondition,
  uv: 1.0,
);

Astro testAstro = Astro(
  sunrise: "test time",
  sunset: "test time",
  moonrise: "test time",
  moonset: "test time",
  moon_phase: "test moonPhase",
  moon_illumination: "test illumination",
);

Hour testHour = Hour(
  time_epoch: 1,
  time: "test time",
  temp_c: 1.0,
  temp_f: 1.0,
  is_day: 1,
  condition: testCondition,
  wind_mph: 1.0,
  wind_kph: 1.0,
  wind_degree: 1,
  wind_dir: "test direction",
  pressure_mb: 1.0,
  pressure_in: 1.0,
  precip_mm: 1.0,
  precip_in: 1.0,
  humidity: 1,
  cloud: 1,
  feelslike_c: 1.0,
  feelslike_f: 1.0,
  windchill_c: 1.0,
  windchill_f: 1.0,
  heatindex_c: 1.0,
  heatindex_f: 1.0,
  dewpoint_c: 1.0,
  dewpoint_f: 1.0,
  will_it_rain: 1,
  chance_of_rain: 1,
  will_it_snow: 1,
  chance_of_snow: 1,
  vis_km: 1.0,
  vis_miles: 1.0,
  gust_mph: 1.0,
  gust_kph: 1.0,
  uv: 1.0,
);
