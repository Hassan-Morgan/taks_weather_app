import 'package:dartz/dartz.dart';
import 'package:taqs/core/errors/exceptions.dart';
import 'package:taqs/core/errors/failures.dart';
import 'package:taqs/core/utils/network_info/network_info.dart';
import 'package:taqs/features/weather_forecast/data/data_sources/remote_data_source.dart';
import 'package:taqs/features/weather_forecast/data/mappers/weather_forecast_to_entity.dart';
import 'package:taqs/features/weather_forecast/domain/entities/weather_entity.dart';
import 'package:taqs/features/weather_forecast/domain/repositories/weather_forecast_repositories.dart';

class WeatherForecastRepositoryImpl extends WeatherForecastRepository {
  final WeatherForecastDataSource dataSource;
  final NetworkInfo networkInfo;

  WeatherForecastRepositoryImpl({
    required this.dataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherForecast(String q) async {
    if (await networkInfo.getCurrentConnectionState) {
      final result = await dataSource.getWeatherForecast(q);
      return result.fold((l) {
        return const Left(
            ServerFailure('Server Failure happened \n please try again later'));
      }, (r) => Right(r.toEntity()));
    } else {
      return const Left(NetworkFailure(
          'Network error happened \n please check your internet connection'));
    }
  }
}
