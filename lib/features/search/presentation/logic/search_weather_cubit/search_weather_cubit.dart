import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/features/search/presentation/logic/search_weather_cubit/search_weather_states/search_weather_states.dart';
import 'package:taqs/features/weather_forecast/domain/use_cases/get_weather_forecast_usecase.dart';

class SearchWeatherCubit extends Cubit<SearchWeatherStates> {
  SearchWeatherCubit({required this.useCase})
      : super(SearchWeatherStates.loading());

  final GetWeatherForecastUseCase useCase;

  void getWeatherByCityName(String cityName) async {
    emit(SearchWeatherStates.loading());
    final result = await useCase(GetWeatherForecastParams(q: cityName));
    result.fold(
      (l) => emit(SearchWeatherStates.error(l.message)),
      (r) => emit(SearchWeatherStates.success(r)),
    );
  }
}
