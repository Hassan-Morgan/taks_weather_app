// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i9;

import '../../../features/search/presentation/pages/search_page.dart' as _i8;
import '../../../features/settings/presentation/pages/settings_page.dart'
    as _i4;
import '../../../features/weather_forecast/domain/entities/sub_entities/astro_enitity.dart'
    as _i11;
import '../../../features/weather_forecast/domain/entities/sub_entities/day_weather_entity.dart'
    as _i12;
import '../../../features/weather_forecast/domain/entities/weather_entity.dart'
    as _i10;
import '../../../features/weather_forecast/presentation/pages/current_weather_details.dart'
    as _i6;
import '../../../features/weather_forecast/presentation/pages/day_details_page.dart'
    as _i7;
import '../../../features/weather_forecast/presentation/pages/home_page.dart'
    as _i5;
import '../app_layout/app_layout.dart' as _i1;
import 'app_router.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AppLayoutRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AppLayout());
    },
    HomeRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HeroEmptyRouterPage());
    },
    SearchRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    SettingsRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SettingsPage());
    },
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.HomePage());
    },
    CurrentWeatherDetails.name: (routeData) {
      final args = routeData.argsAs<CurrentWeatherDetailsArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.CurrentWeatherDetails(key: args.key, entity: args.entity));
    },
    DayDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DayDetailsRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.DayDetailsPage(
              key: args.key, astro: args.astro, day: args.day));
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>(
          orElse: () => const SearchRouteArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.SearchPage(key: args.key));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(AppLayoutRouter.name, path: '/', children: [
          _i3.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: AppLayoutRouter.name,
              children: [
                _i3.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i3.RouteConfig(CurrentWeatherDetails.name,
                    path: 'currentWeatherDetails', parent: HomeRouter.name),
                _i3.RouteConfig(DayDetailsRoute.name,
                    path: 'dayDetailsPage', parent: HomeRouter.name)
              ]),
          _i3.RouteConfig(SearchRouter.name,
              path: 'search',
              parent: AppLayoutRouter.name,
              children: [
                _i3.RouteConfig(SearchRoute.name,
                    path: '', parent: SearchRouter.name)
              ]),
          _i3.RouteConfig(SettingsRouter.name,
              path: 'settings', parent: AppLayoutRouter.name)
        ])
      ];
}

/// generated route for
/// [_i1.AppLayout]
class AppLayoutRouter extends _i3.PageRouteInfo<void> {
  const AppLayoutRouter({List<_i3.PageRouteInfo>? children})
      : super(AppLayoutRouter.name, path: '/', initialChildren: children);

  static const String name = 'AppLayoutRouter';
}

/// generated route for
/// [_i2.HeroEmptyRouterPage]
class HomeRouter extends _i3.PageRouteInfo<void> {
  const HomeRouter({List<_i3.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class SearchRouter extends _i3.PageRouteInfo<void> {
  const SearchRouter({List<_i3.PageRouteInfo>? children})
      : super(SearchRouter.name, path: 'search', initialChildren: children);

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsRouter extends _i3.PageRouteInfo<void> {
  const SettingsRouter() : super(SettingsRouter.name, path: 'settings');

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.CurrentWeatherDetails]
class CurrentWeatherDetails
    extends _i3.PageRouteInfo<CurrentWeatherDetailsArgs> {
  CurrentWeatherDetails({_i9.Key? key, required _i10.WeatherEntity entity})
      : super(CurrentWeatherDetails.name,
            path: 'currentWeatherDetails',
            args: CurrentWeatherDetailsArgs(key: key, entity: entity));

  static const String name = 'CurrentWeatherDetails';
}

class CurrentWeatherDetailsArgs {
  const CurrentWeatherDetailsArgs({this.key, required this.entity});

  final _i9.Key? key;

  final _i10.WeatherEntity entity;

  @override
  String toString() {
    return 'CurrentWeatherDetailsArgs{key: $key, entity: $entity}';
  }
}

/// generated route for
/// [_i7.DayDetailsPage]
class DayDetailsRoute extends _i3.PageRouteInfo<DayDetailsRouteArgs> {
  DayDetailsRoute(
      {_i9.Key? key,
      required _i11.AstroEntity astro,
      required _i12.DayEntity day})
      : super(DayDetailsRoute.name,
            path: 'dayDetailsPage',
            args: DayDetailsRouteArgs(key: key, astro: astro, day: day));

  static const String name = 'DayDetailsRoute';
}

class DayDetailsRouteArgs {
  const DayDetailsRouteArgs({this.key, required this.astro, required this.day});

  final _i9.Key? key;

  final _i11.AstroEntity astro;

  final _i12.DayEntity day;

  @override
  String toString() {
    return 'DayDetailsRouteArgs{key: $key, astro: $astro, day: $day}';
  }
}

/// generated route for
/// [_i8.SearchPage]
class SearchRoute extends _i3.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({_i9.Key? key})
      : super(SearchRoute.name, path: '', args: SearchRouteArgs(key: key));

  static const String name = 'SearchRoute';
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key}';
  }
}
