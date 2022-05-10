import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taqs/core/errors/exceptions.dart';
import 'package:taqs/core/errors/failures.dart';
import 'package:taqs/core/utils/network_info/network_info.dart';
import 'package:taqs/features/weather_forecast/data/data_sources/remote_data_source.dart';
import 'package:taqs/features/weather_forecast/data/repositories/weather_forecast_repository.dart';

import '../../domain_test/test_entities/test_weather_entity.dart';
import '../models_test/test_model.dart';
import 'weather_forecast_repository_test.mocks.dart';

@GenerateMocks([WeatherForecastDataSourceImpl, NetworkInfoImpl])
void main() {
  late WeatherForecastRepositoryImpl repositoryImpl;
  late MockWeatherForecastDataSourceImpl dataSourceImpl;
  late MockNetworkInfoImpl networkInfoImpl;

  setUp(() {
    dataSourceImpl = MockWeatherForecastDataSourceImpl();
    networkInfoImpl = MockNetworkInfoImpl();
    repositoryImpl = WeatherForecastRepositoryImpl(
      dataSource: dataSourceImpl,
      networkInfo: networkInfoImpl,
    );
  });

  group('networkConnection is true', () {
    setUp(() {
      when(networkInfoImpl.getCurrentConnectionState)
          .thenAnswer((realInvocation) async => true);
    });

    test(
        'should return WeatherForecastEntity when call the getWeatherForecast and return WeatherForecastModel',
        () async {
      when(dataSourceImpl.getWeatherForecast(any))
          .thenAnswer((realInvocation) async => Right(testModel));
      final result = await repositoryImpl.getWeatherForecast('test');
      expect(result, Right(testWeatherEntity));
      verify(dataSourceImpl.getWeatherForecast('test'));
      verify(networkInfoImpl.getCurrentConnectionState);
    });

    test(
        'should return ServerFailure when call the getWeatherForecast and return ServerException',
        () async {
      when(dataSourceImpl.getWeatherForecast(any))
          .thenAnswer((realInvocation) async => const Left(ServerException(1)));
      final result = await repositoryImpl.getWeatherForecast('test');
      expect(result, const Left(ServerFailure('Server error happened \n Error code 1')));
      verify(dataSourceImpl.getWeatherForecast('test'));
      verify(networkInfoImpl.getCurrentConnectionState);
    });
  });

  group('networkConnection is false', () {
    setUp(() {
      when(networkInfoImpl.getCurrentConnectionState)
          .thenAnswer((realInvocation) async => false);
    });

    test('should return networkFailure when call the function', () async {
      final result = await repositoryImpl.getWeatherForecast('test');
      expect(
          result,
          const Left(NetworkFailure(
              'Network error happened \n please check your internet connection')));
    });
  });
}
