import 'package:flutter_test/flutter_test.dart';
import 'package:taqs/features/weather_forecast/data/mappers/weather_forecast_to_entity.dart';

import '../../domain_test/test_entities/test_weather_entity.dart';
import '../models_test/test_model.dart';

void main (){
  test('when call the to entity extension with WeatherModel should return weatherEntity', (){
    final result = testModel.toEntity();
    expect(result, testWeatherEntity);
  });
}