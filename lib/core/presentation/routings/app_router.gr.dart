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
import 'package:flutter/material.dart' as _i8;

import '../../../features/weather_forecast/domain/entities/weather_entity.dart'
    as _i9;
import '../../../features/search/presentation/pages/search_page.dart'
    as _i7;
import '../../../features/weather_forecast/presentation/pages/current_weather_details.dart'
    as _i6;
import '../../../features/weather_forecast/presentation/pages/home_page.dart'
    as _i5;
import '../../../features/settings/presentation/pages/settings_page.dart'
    as _i4;
import '../app_layout/app_layout.dart' as _i1;
import 'app_router.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
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
    AddRouter.name: (routeData) {
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
    CurrentWeatherDetailsRout.name: (routeData) {
      final args = routeData.argsAs<CurrentWeatherDetailsRoutArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.CurrentWeatherDetails(key: args.key, entity: args.entity));
    },
    AddRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AddPage());
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
                _i3.RouteConfig(CurrentWeatherDetailsRout.name,
                    path: 'currentWeatherDetails', parent: HomeRouter.name)
              ]),
          _i3.RouteConfig(AddRouter.name,
              path: 'add',
              parent: AppLayoutRouter.name,
              children: [
                _i3.RouteConfig(AddRoute.name, path: '', parent: AddRouter.name)
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
class AddRouter extends _i3.PageRouteInfo<void> {
  const AddRouter({List<_i3.PageRouteInfo>? children})
      : super(AddRouter.name, path: 'add', initialChildren: children);

  static const String name = 'AddRouter';
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
class CurrentWeatherDetailsRout
    extends _i3.PageRouteInfo<CurrentWeatherDetailsRoutArgs> {
  CurrentWeatherDetailsRout({_i8.Key? key, required _i9.WeatherEntity entity})
      : super(CurrentWeatherDetailsRout.name,
            path: 'currentWeatherDetails',
            args: CurrentWeatherDetailsRoutArgs(key: key, entity: entity));

  static const String name = 'CurrentWeatherDetailsRout';
}

class CurrentWeatherDetailsRoutArgs {
  const CurrentWeatherDetailsRoutArgs({this.key, required this.entity});

  final _i8.Key? key;

  final _i9.WeatherEntity entity;

  @override
  String toString() {
    return 'CurrentWeatherDetailsRoutArgs{key: $key, entity: $entity}';
  }
}

/// generated route for
/// [_i7.AddPage]
class AddRoute extends _i3.PageRouteInfo<void> {
  const AddRoute() : super(AddRoute.name, path: '');

  static const String name = 'AddRoute';
}
