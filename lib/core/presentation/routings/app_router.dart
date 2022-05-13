import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taqs/core/presentation/app_layout/app_layout.dart';
import 'package:taqs/features/search/presentation/pages/search_page.dart';
import 'package:taqs/features/search/presentation/pages/search_result_weather.dart';
import 'package:taqs/features/weather_forecast/presentation/pages/current_weather_details.dart';
import 'package:taqs/features/weather_forecast/presentation/pages/day_details_page.dart';
import 'package:taqs/features/weather_forecast/presentation/pages/home_page.dart';
import 'package:taqs/features/settings/presentation/pages/settings_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      name: 'appLayoutRouter',
      page: AppLayout,
      children: [
        AutoRoute(
          path: 'home',
          name: 'homeRouter',
          page: HeroEmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: HomePage,
            ),
            AutoRoute(
              path: 'currentWeatherDetails',
              page: CurrentWeatherDetails,
            ),
            AutoRoute(
              path: 'dayDetailsPage',
              page: DayDetailsPage,
            )
          ],
        ),
        AutoRoute(
          path: 'search',
          name: 'searchRouter',
          page: HeroEmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: SearchPage,
            ),
            AutoRoute(
              path: 'searchWeather',
              page: SearchWeatherPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'settings',
          name: 'settingsRouter',
          page: SettingsPage,
        ),
      ],
    ),
  ],
)
class $AppRouter {}

class HeroEmptyRouterPage extends StatelessWidget {
  const HeroEmptyRouterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeroControllerScope(
      controller: HeroController(),
      child: const AutoRouter(),
    );
  }
}
