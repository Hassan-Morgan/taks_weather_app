import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taqs/core/errors/failures.dart';
import 'package:taqs/features/search/presentation/logic/search_weather_cubit/search_weather_cubit.dart';
import 'package:taqs/features/search/presentation/logic/search_weather_cubit/search_weather_states/search_weather_states.dart';
import 'package:taqs/features/weather_forecast/domain/use_cases/get_weather_forecast_usecase.dart';

import '../../../../weather_forcast_test/domain_test/test_entities/test_weather_entity.dart';
import '../../../../weather_forcast_test/presentation_test/logic_test/weather_forecast_cubit_test.mocks.dart';

void main() {
  late SearchWeatherCubit cubit;
  late MockGetWeatherForecastUseCase useCase;

  setUp(
    () {
      useCase = MockGetWeatherForecastUseCase();
      cubit = SearchWeatherCubit(useCase: useCase);
    },
  );

  test(
    'initial state should be the loading state',
    () {
      expect(cubit.state, SearchWeatherStates.loading());
    },
  );

  test(
    'should set the state from loading to success when call getWeatherByCityName and no errors happen',
    () async {
      when(useCase(any))
          .thenAnswer((realInvocation) async => Right(testWeatherEntity));
      cubit.getWeatherByCityName('test');
      await untilCalled(useCase(any));
      expect(cubit.state, SearchWeatherStates.success(testWeatherEntity));
      verify(useCase(const GetWeatherForecastParams(q: 'test')));
    },
  );

  test(
    'should set the state from loading to error when call getWeatherByCityName and error happen',
    () async {
      when(useCase(any)).thenAnswer(
          (realInvocation) async => const Left(ServerFailure('test message')));
      cubit.getWeatherByCityName('test');
      await untilCalled(useCase(any));
      expect(cubit.state, SearchWeatherStates.error('test message'));
      verify(useCase(const GetWeatherForecastParams(q: 'test')));
    },
  );
}
