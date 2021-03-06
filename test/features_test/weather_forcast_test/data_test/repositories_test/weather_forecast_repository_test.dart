import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taqs/core/errors/exceptions.dart';
import 'package:taqs/core/errors/failures.dart';
import 'package:taqs/core/utils/network_info/network_info.dart';
import 'package:taqs/features/weather_forecast/data/data_sources/remote_data_source.dart';
import 'package:taqs/features/weather_forecast/data/repositories/weather_forecast_repository.dart';
import 'package:taqs/features/weather_forecast/domain/repositories/weather_forecast_repositories.dart';

import '../../domain_test/test_entities/test_weather_entity.dart';
import '../models_test/test_model.dart';
import 'weather_forecast_repository_test.mocks.dart';

@GenerateMocks([WeatherForecastDataSource, NetworkInfo])
void main() {
  late WeatherForecastRepository repository;
  late MockWeatherForecastDataSource dataSource;
  late MockNetworkInfo networkInfo;

  setUp(() {
    dataSource = MockWeatherForecastDataSource();
    networkInfo = MockNetworkInfo();
    repository = WeatherForecastRepositoryImpl(
      dataSource: dataSource,
      networkInfo: networkInfo,
    );
  });

  group('networkConnection is true', () {
    setUp(() {
      when(networkInfo.getCurrentConnectionState)
          .thenAnswer((realInvocation) async => true);
    });

    test(
        'should return WeatherForecastEntity when call the getWeatherForecast and return WeatherForecastModel',
        () async {
      when(dataSource.getWeatherForecast(any))
          .thenAnswer((realInvocation) async => Right(testModel));
      final result = await repository.getWeatherForecast('test');
      expect(result, Right(testWeatherEntity));
      verify(dataSource.getWeatherForecast('test'));
      verify(networkInfo.getCurrentConnectionState);
    });

    test(
        'should return ServerFailure when call the getWeatherForecast and return ServerException',
        () async {
      when(dataSource.getWeatherForecast(any))
          .thenAnswer((realInvocation) async => const Left(ServerException()));
      final result = await repository.getWeatherForecast('test');
      expect(
          result,
          const Left(ServerFailure(
              'Server Failure happened \n please try again later')));
      verify(dataSource.getWeatherForecast('test'));
      verify(networkInfo.getCurrentConnectionState);
    });
  });

  group('networkConnection is false', () {
    setUp(() {
      when(networkInfo.getCurrentConnectionState)
          .thenAnswer((realInvocation) async => false);
    });

    test('should return networkFailure when call the function', () async {
      final result = await repository.getWeatherForecast('test');
      verifyZeroInteractions(dataSource);
      verify(networkInfo.getCurrentConnectionState);
      expect(
          result,
          const Left(NetworkFailure(
              'Network error happened \n please check your internet connection')));
    });
  });
}
