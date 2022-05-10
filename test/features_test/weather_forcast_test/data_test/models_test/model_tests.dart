import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:taqs/features/weather_forecast/data/models/weather_forecast_model.dart';

import '../../../../fixtures/fixtures_reader.dart';
import 'test_model.dart';

void main() {
  Map<String, dynamic> testMapDouble =
      json.decode(fixtureReader('weather_forecast_double_response.json'));
  Map<String, dynamic> testMapInt =
      json.decode(fixtureReader('weather_forecast_int_response.json'));

  group('fromJson', () {
    test(
        'should return weather model when call the fromJson Function with json with int values',
        () {
      final result = WeatherForecastModel.fromJson(testMapInt);
      expect(result, testModel);
    });

    test(
        'should return weather model when call the fromJson Function with json with double values',
        () {
      final result = WeatherForecastModel.fromJson(testMapDouble);
      expect(result, testModel);
    });
  });

  group('toJson', () {
    test(
        'should return testMapDouble when call the toJson Function on testModel',
        () {
      final result =  testModel.toJson();
      expect(result, testMapDouble);
    });
  });
}
