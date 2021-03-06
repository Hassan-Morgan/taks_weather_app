// Mocks generated by Mockito 5.1.0 from annotations
// in taqs/test/features_test/weather_forcast_test/data_test/repositories_test/weather_forecast_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:taqs/core/utils/network_info/network_info.dart' as _i6;
import 'package:taqs/features/weather_forecast/data/data_sources/remote_data_source.dart'
    as _i3;
import 'package:taqs/features/weather_forecast/data/models/weather_forecast_model.dart'
    as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [WeatherForecastDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherForecastDataSource extends _i1.Mock
    implements _i3.WeatherForecastDataSource {
  MockWeatherForecastDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<Exception, _i5.WeatherForecastModel>>
      getWeatherForecast(String? q) => (super.noSuchMethod(
              Invocation.method(#getWeatherForecast, [q]),
              returnValue:
                  Future<_i2.Either<Exception, _i5.WeatherForecastModel>>.value(
                      _FakeEither_0<Exception, _i5.WeatherForecastModel>()))
          as _i4.Future<_i2.Either<Exception, _i5.WeatherForecastModel>>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i6.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> get getCurrentConnectionState =>
      (super.noSuchMethod(Invocation.getter(#getCurrentConnectionState),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}
