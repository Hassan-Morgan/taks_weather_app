import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:location/location.dart';
import 'package:taqs/core/utils/location_services/get_current_location.dart';
import 'package:taqs/core/utils/network_info/network_info.dart';
import 'package:taqs/features/search/data/data_sources/search_remote_datasource.dart';
import 'package:taqs/features/search/data/data_sources/search_retrofit/search_retrofit.dart';
import 'package:taqs/features/search/data/repositories/search_repository.dart';
import 'package:taqs/features/search/domain/repositories/search_repository.dart';
import 'package:taqs/features/search/domain/usecases/search_usecase.dart';
import 'package:taqs/features/search/presentation/logic/search_cubit/search_cubit.dart';
import 'package:taqs/features/search/presentation/logic/search_weather_cubit/search_weather_cubit.dart';
import 'package:taqs/features/weather_forecast/data/data_sources/remote_data_source.dart';
import 'package:taqs/features/weather_forecast/data/data_sources/weather_forecast_retrofit/weather_forecast_retrofit.dart';
import 'package:taqs/features/weather_forecast/data/repositories/weather_forecast_repository.dart';
import 'package:taqs/features/weather_forecast/domain/use_cases/get_weather_forecast_usecase.dart';
import 'package:taqs/features/weather_forecast/presentation/logic/weather_forecast_cubit.dart';
import 'package:dio/dio.dart';
import 'features/weather_forecast/domain/repositories/weather_forecast_repositories.dart';

final sl = GetIt.instance;

void setup() {
  ///Weather forecast feature
  // presentation
  sl.registerLazySingleton(
    () => WeatherForecastCubit(
      useCase: sl(),
      locationServices: sl(),
    ),
  );
  //domain
  sl.registerLazySingleton(() => GetWeatherForecastUseCase(sl()));
  // data
  sl.registerLazySingleton<WeatherForecastRepository>(
    () => WeatherForecastRepositoryImpl(
      dataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<WeatherForecastDataSource>(
      () => WeatherForecastDataSourceImpl(sl()));
  sl.registerLazySingleton(() => WeatherForecastRetrofit(sl()));

  ///search feature
  //presentation
  sl.registerLazySingleton(() => SearchCubit(usecase: sl()));
  sl.registerLazySingleton(() => SearchWeatherCubit(useCase: sl()));
  //domain
  sl.registerLazySingleton(() => SearchUsecase(sl()));
  //data
  sl.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(datasource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<SearchRemoteDatasource>(
      () => SearchRemoteDatasourceImpl(sl()));
  sl.registerLazySingleton(() => SearchRetrofit(sl()));

  /// core
  sl.registerLazySingleton<LocationServices>(() => LocationServicesImpl(sl()));
  sl.registerLazySingleton(() => Location.instance);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
