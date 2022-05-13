import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taqs/core/errors/failures.dart';
import 'package:taqs/features/weather_forecast/domain/repositories/weather_forecast_repositories.dart';
import 'package:taqs/features/weather_forecast/domain/use_cases/get_weather_forecast_usecase.dart';

import '../../test_entities/test_weather_entity.dart';
import 'get_weather_forecast_usecase_test.mocks.dart';

@GenerateMocks([WeatherForecastRepository])
void main() {
  late MockWeatherForecastRepository repository;
  late GetWeatherForecastUseCase useCase;

  setUp(() {
    repository = MockWeatherForecastRepository();
    useCase = GetWeatherForecastUseCase(repository);
  });

  const testCityName = 'testCityName';

  test(
      'should return weatherEntity when call the function and no errors happen',
      () async {
    when(repository.getWeatherForecast(any))
        .thenAnswer((realInvocation) async => Right(testWeatherEntity));

    final result =
        await useCase(const GetWeatherForecastParams(q: testCityName));

    verify(repository.getWeatherForecast(testCityName));
    expect(result, Right(testWeatherEntity));
  });

  test('should return ServerFailure when call the function and error happen',
      () async {
    when(repository.getWeatherForecast(any)).thenAnswer(
        (realInvocation) async => const Left(ServerFailure('testFailure')));
    final result =
        await useCase(const GetWeatherForecastParams(q: testCityName));
    verify(repository.getWeatherForecast(testCityName));
    expect(result, const Left(ServerFailure('testFailure')));
  });
}
