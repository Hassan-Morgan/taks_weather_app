// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../../../features/search/presentation/pages/search_page.dart' as _i7;
import '../../../features/search/presentation/pages/search_result_weather.dart'
    as _i8;
import '../../../features/settings/presentation/pages/settings_page.dart'
    as _i3;
import '../../../features/weather_forecast/domain/entities/sub_entities/astro_enitity.dart'
    as _i12;
import '../../../features/weather_forecast/domain/entities/sub_entities/day_weather_entity.dart'
    as _i13;
import '../../../features/weather_forecast/domain/entities/weather_entity.dart'
    as _i11;
import '../../../features/weather_forecast/presentation/pages/current_weather_details.dart'
    as _i5;
import '../../../features/weather_forecast/presentation/pages/day_details_page.dart'
    as _i6;
import '../../../features/weather_forecast/presentation/pages/home_page.dart'
    as _i4;
import '../app_layout/app_layout.dart' as _i1;
import 'app_router.dart' as _i2;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AppLayoutRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AppLayout());
    },
    HomeRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HeroEmptyRouterPage());
    },
    SearchRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HeroEmptyRouterPage());
    },
    SettingsRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SettingsPage());
    },
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomePage());
    },
    CurrentWeatherDetails.name: (routeData) {
      final args = routeData.argsAs<CurrentWeatherDetailsArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.CurrentWeatherDetails(key: args.key, entity: args.entity));
    },
    DayDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DayDetailsRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.DayDetailsPage(
              key: args.key, astro: args.astro, day: args.day));
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>(
          orElse: () => const SearchRouteArgs());
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.SearchPage(key: args.key));
    },
    SearchWeatherRoute.name: (routeData) {
      final args = routeData.argsAs<SearchWeatherRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.SearchWeatherPage(key: args.key, cityName: args.cityName));
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(AppLayoutRouter.name, path: '/', children: [
          _i9.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: AppLayoutRouter.name,
              children: [
                _i9.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i9.RouteConfig(CurrentWeatherDetails.name,
                    path: 'currentWeatherDetails', parent: HomeRouter.name),
                _i9.RouteConfig(DayDetailsRoute.name,
                    path: 'dayDetailsPage', parent: HomeRouter.name)
              ]),
          _i9.RouteConfig(SearchRouter.name,
              path: 'search',
              parent: AppLayoutRouter.name,
              children: [
                _i9.RouteConfig(SearchRoute.name,
                    path: '', parent: SearchRouter.name),
                _i9.RouteConfig(SearchWeatherRoute.name,
                    path: 'searchWeather', parent: SearchRouter.name)
              ]),
          _i9.RouteConfig(SettingsRouter.name,
              path: 'settings', parent: AppLayoutRouter.name)
        ])
      ];
}

/// generated route for
/// [_i1.AppLayout]
class AppLayoutRouter extends _i9.PageRouteInfo<void> {
  const AppLayoutRouter({List<_i9.PageRouteInfo>? children})
      : super(AppLayoutRouter.name, path: '/', initialChildren: children);

  static const String name = 'AppLayoutRouter';
}

/// generated route for
/// [_i2.HeroEmptyRouterPage]
class HomeRouter extends _i9.PageRouteInfo<void> {
  const HomeRouter({List<_i9.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i2.HeroEmptyRouterPage]
class SearchRouter extends _i9.PageRouteInfo<void> {
  const SearchRouter({List<_i9.PageRouteInfo>? children})
      : super(SearchRouter.name, path: 'search', initialChildren: children);

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i3.SettingsPage]
class SettingsRouter extends _i9.PageRouteInfo<void> {
  const SettingsRouter() : super(SettingsRouter.name, path: 'settings');

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.CurrentWeatherDetails]
class CurrentWeatherDetails
    extends _i9.PageRouteInfo<CurrentWeatherDetailsArgs> {
  CurrentWeatherDetails({_i10.Key? key, required _i11.WeatherEntity entity})
      : super(CurrentWeatherDetails.name,
            path: 'currentWeatherDetails',
            args: CurrentWeatherDetailsArgs(key: key, entity: entity));

  static const String name = 'CurrentWeatherDetails';
}

class CurrentWeatherDetailsArgs {
  const CurrentWeatherDetailsArgs({this.key, required this.entity});

  final _i10.Key? key;

  final _i11.WeatherEntity entity;

  @override
  String toString() {
    return 'CurrentWeatherDetailsArgs{key: $key, entity: $entity}';
  }
}

/// generated route for
/// [_i6.DayDetailsPage]
class DayDetailsRoute extends _i9.PageRouteInfo<DayDetailsRouteArgs> {
  DayDetailsRoute(
      {_i10.Key? key,
      required _i12.AstroEntity astro,
      required _i13.DayEntity day})
      : super(DayDetailsRoute.name,
            path: 'dayDetailsPage',
            args: DayDetailsRouteArgs(key: key, astro: astro, day: day));

  static const String name = 'DayDetailsRoute';
}

class DayDetailsRouteArgs {
  const DayDetailsRouteArgs({this.key, required this.astro, required this.day});

  final _i10.Key? key;

  final _i12.AstroEntity astro;

  final _i13.DayEntity day;

  @override
  String toString() {
    return 'DayDetailsRouteArgs{key: $key, astro: $astro, day: $day}';
  }
}

/// generated route for
/// [_i7.SearchPage]
class SearchRoute extends _i9.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({_i10.Key? key})
      : super(SearchRoute.name, path: '', args: SearchRouteArgs(key: key));

  static const String name = 'SearchRoute';
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.SearchWeatherPage]
class SearchWeatherRoute extends _i9.PageRouteInfo<SearchWeatherRouteArgs> {
  SearchWeatherRoute({_i10.Key? key, required String cityName})
      : super(SearchWeatherRoute.name,
            path: 'searchWeather',
            args: SearchWeatherRouteArgs(key: key, cityName: cityName));

  static const String name = 'SearchWeatherRoute';
}

class SearchWeatherRouteArgs {
  const SearchWeatherRouteArgs({this.key, required this.cityName});

  final _i10.Key? key;

  final String cityName;

  @override
  String toString() {
    return 'SearchWeatherRouteArgs{key: $key, cityName: $cityName}';
  }
}
