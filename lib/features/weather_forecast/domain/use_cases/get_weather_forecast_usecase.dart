import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:taqs/core/use_cases/use_case.dart';
import 'package:taqs/features/weather_forecast/domain/entities/weather_entity.dart';
import 'package:taqs/features/weather_forecast/domain/repositories/weather_forecast_repositories.dart';

import '../../../../core/errors/failures.dart';

class GetWeatherForecastUseCase
    implements UseCase<WeatherEntity, GetWeatherForecastParams> {
  final WeatherForecastRepository repository;

  GetWeatherForecastUseCase(this.repository);

  @override
  Future<Either<Failure, WeatherEntity>> call(
      GetWeatherForecastParams params) async {
    return await repository.getWeatherForecast(params.q);
  }
}

class GetWeatherForecastParams extends Equatable {
  final String q;

  const GetWeatherForecastParams({required this.q});

  @override
  List<Object?> get props => [q];
}
