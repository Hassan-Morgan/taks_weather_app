import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/core/presentation/shared_widgets/loading.dart';
import 'package:taqs/features/weather_forecast/presentation/logic/weather_forecast_cubit.dart';
import 'package:taqs/features/weather_forecast/presentation/logic/weather_forecast_states/weather_forecast_states.dart';
import 'package:taqs/core/presentation/shared_widgets/error.dart';
import 'package:taqs/features/weather_forecast/presentation/pages/home_page_sucess.dart';

import '../logic/weather_forecast_states/weather_forecast_states.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastCubit, WeatherForecastStates>(
      builder: (context, state) => state.when(
        loading: () => const LoadingPage(),
        error: (error) => ErrorPage(
          error: error,
          pageIndex: 1,
        ),
        success: (data) => HomePageSuccess(entity: data),
      ),
    );
  }
}
