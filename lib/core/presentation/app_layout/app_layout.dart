import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/core/constants/app_constants.dart';
import 'package:taqs/core/presentation/resources/color_manager.dart';
import 'package:taqs/features/weather_forecast/presentation/logic/weather_forecast_cubit.dart';
import 'package:taqs/features/weather_forecast/presentation/logic/weather_forecast_states/weather_forecast_states.dart';

import '../routings/app_router.gr.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastCubit, WeatherForecastStates>(
      builder: (context, state) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: mode == ThemeMode.light
                  ? [ColorManager.dayColor, ColorManager.dayColor2]
                  : [ColorManager.nightColor, ColorManager.nightColor2]),
        ),
        child: AutoTabsScaffold(
          routes: const [
            HomeRouter(),
            AddRouter(),
            SettingsRouter(),
          ],
          backgroundColor: Colors.transparent,
          bottomNavigationBuilder: (context, tabsRouter) => BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            elevation: 0.0,
            onTap: tabsRouter.setActiveIndex,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.15),
            selectedItemColor: ColorManager.redColor,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
