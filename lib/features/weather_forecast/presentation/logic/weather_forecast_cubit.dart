import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:taqs/core/constants/app_constants.dart';
import 'package:taqs/core/utils/location_services/get_current_location.dart';
import 'package:taqs/features/weather_forecast/domain/entities/weather_entity.dart';
import 'package:taqs/features/weather_forecast/domain/use_cases/get_weather_forecast_usecase.dart';
import 'package:taqs/features/weather_forecast/presentation/logic/weather_forecast_states/weather_forecast_states.dart';

import '../../../../core/errors/failures.dart';

class WeatherForecastCubit extends Cubit<WeatherForecastStates> {
  WeatherForecastCubit({required this.useCase, required this.locationServices})
      : super(WeatherForecastStates.loading());

  final GetWeatherForecastUseCase useCase;
  final LocationServices locationServices;

  void getWeatherForecastWithLocation() async {
    emit(WeatherForecastStates.loading());
    final location = await locationServices.getCurrentLocation();

    location.fold(
      (Failure locationFailure) {
        emit(WeatherForecastStates.error(locationFailure.message));
      },
      (LocationData locationData) async {
        _callGetWeatherUseCase(
            '${locationData.latitude},${locationData.longitude}');
      },
    );
  }

  void getWeatherForecastByCityName({required String cityName}) {
    emit(WeatherForecastStates.loading());

    _callGetWeatherUseCase(cityName);
  }

  void _callGetWeatherUseCase(String q) async {
    final result = await useCase(GetWeatherForecastParams(q: q));

    result.fold(
      (Failure failure) {
        emit(WeatherForecastStates.error(failure.message));
      },
      (WeatherEntity weatherEntity) {
        if (weatherEntity.current.isDay == 0) {
          mode = ThemeMode.dark;
        }
        emit(WeatherForecastStates.success(weatherEntity));
      },
    );
  }
}
