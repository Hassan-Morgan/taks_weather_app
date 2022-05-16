import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/core/constants/app_constants.dart';
import 'package:taqs/core/presentation/resources/theme_manager.dart';
import 'package:taqs/features/settings/presentation/logic/settings_cubit.dart';
import 'package:taqs/features/weather_forecast/presentation/logic/weather_forecast_cubit.dart';
import 'package:taqs/features/weather_forecast/presentation/logic/weather_forecast_states/weather_forecast_states.dart';
import 'package:taqs/injection.dart';

import 'core/presentation/routings/app_router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<SettingsCubit>()..getSettingsData(),
        ),
        BlocProvider(
          create: (context) =>
              sl<WeatherForecastCubit>()..getWeatherForecastWithLocation(),
        ),
      ],
      child: BlocBuilder<WeatherForecastCubit, WeatherForecastStates>(
        builder: (context, state) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: mode,
          theme: ThemeManager.lightTheme,
          darkTheme: ThemeManager.darkTheme,
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
        ),
      ),
    );
  }
}
