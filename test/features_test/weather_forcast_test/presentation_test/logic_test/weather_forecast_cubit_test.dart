import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/location.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taqs/core/errors/failures.dart';
import 'package:taqs/core/utils/location_services/get_current_location.dart';
import 'package:taqs/features/weather_forecast/domain/use_cases/get_weather_forecast_usecase.dart';
import 'package:taqs/features/weather_forecast/presentation/logic/weather_forecast_cubit.dart';
import 'package:taqs/features/weather_forecast/presentation/logic/weather_forecast_states/weather_forecast_states.dart';

import '../../domain_test/test_entities/test_weather_entity.dart';
import 'weather_forecast_cubit_test.mocks.dart';

@GenerateMocks([GetWeatherForecastUseCase, LocationServices])
void main() {
  late WeatherForecastCubit cubit;
  late MockGetWeatherForecastUseCase useCase;
  late MockLocationServices locationServices;

  setUp(() {
    useCase = MockGetWeatherForecastUseCase();
    locationServices = MockLocationServices();
    cubit = WeatherForecastCubit(
        useCase: useCase, locationServices: locationServices);
  });

  final LocationData tLocation = LocationData.fromMap({'test1': 1, 'test2': 1});
  const failureTestMessage = 'failure test message';

  test('initial state should be loading state', () {
    expect(cubit.state, WeatherForecastStates.loading());
  });

  group('getWeatherForecast With Location', () {
    group('get location success', () {
      setUp(() {
        when(locationServices.getCurrentLocation())
            .thenAnswer((realInvocation) async => Right(tLocation));
      });
      test(
          '''should start with loading state and when function is finished correctly 
        should set state to success state with WeatherEntity on it 
        and verify that useCase called with location as parameter''', () async {
        when(useCase(any))
            .thenAnswer((realInvocation) async => Right(testWeatherEntity));
        cubit.getWeatherForecastWithLocation();
        await untilCalled(locationServices.getCurrentLocation());
        expect(cubit.state, WeatherForecastStates.loading());
        await untilCalled(useCase(any));
        verify(locationServices.getCurrentLocation());
        verify(useCase(GetWeatherForecastParams(
            q: '${tLocation.latitude},${tLocation.longitude}')));
        expect(cubit.state, WeatherForecastStates.success(testWeatherEntity));
      });
      test(
          'should set the state to error state when call the function and useCase return Failure',
          () async {
        when(useCase(any)).thenAnswer((realInvocation) async =>
            const Left(NetworkFailure(failureTestMessage)));
        cubit.getWeatherForecastWithLocation();
        await untilCalled(locationServices.getCurrentLocation());
        await untilCalled(useCase(any));
        verify(locationServices.getCurrentLocation());
        verify(useCase(GetWeatherForecastParams(
            q: '${tLocation.latitude},${tLocation.longitude}')));
        expect(cubit.state, WeatherForecastStates.error(failureTestMessage));
      });
    });
    group('get location error', () {
      setUp(() {
        when(locationServices.getCurrentLocation()).thenAnswer(
            (realInvocation) async =>
                const Left(GetPermissionFailure(failureTestMessage)));
      });
      test(
          '''should set state to error state when call location function and failure happen 
      and should verify the the useCase is not called''', () async {
        cubit.getWeatherForecastWithLocation();
        await untilCalled(locationServices.getCurrentLocation());
        verify(locationServices.getCurrentLocation());
        verifyNever(useCase(any));
        expect(cubit.state, WeatherForecastStates.error(failureTestMessage));
      });
    });
  });

  group('get location with cityName', () {
    test(
        'should set the state to success state with WeatherEntity when call the function and useCase return weatherEntity',
        () async {
      when(useCase(any))
          .thenAnswer((realInvocation) async => Right(testWeatherEntity));
      cubit.getWeatherForecastByCityName(cityName: 'test');
      expect(cubit.state, WeatherForecastStates.loading());
      await untilCalled(useCase(any));
      verify(useCase(const GetWeatherForecastParams(q: 'test')));
      expect(cubit.state, WeatherForecastStates.success(testWeatherEntity));
    });

    test(
        'should return Failure when call the function and useCase return failure',
        () async {
      when(useCase(any)).thenAnswer((realInvocation) async =>
          const Left(ServerFailure(failureTestMessage)));
      cubit.getWeatherForecastByCityName(cityName: 'test');
      expect(cubit.state, WeatherForecastStates.loading());
      await untilCalled(useCase(any));
      expect(cubit.state, WeatherForecastStates.error(failureTestMessage));
      verify(useCase(const GetWeatherForecastParams(q: 'test')));
    });
  });
}
