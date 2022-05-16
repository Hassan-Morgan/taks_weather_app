import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taqs/core/presentation/shared_widgets/details_container.dart';
import 'package:taqs/features/weather_forecast/domain/entities/weather_entity.dart';
import 'package:taqs/features/weather_forecast/presentation/widgets/current_weather_widget.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/presentation/resources/color_manager.dart';
import '../../../../core/presentation/shared_widgets/details_item.dart';
import '../../../../core/utils/temp_and_speed_selectors/speed_selector.dart';
import '../../../../core/utils/temp_and_speed_selectors/temperature_selector.dart';

class CurrentWeatherDetails extends StatelessWidget {
  final WeatherEntity entity;

  const CurrentWeatherDetails({
    Key? key,
    required this.entity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: mode == ThemeMode.light
                ? [ColorManager.dayColor, ColorManager.dayColor2]
                : [ColorManager.nightColor, ColorManager.nightColor2]),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    AutoRouter.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).primaryColor,
                  )),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 27,
                    ),
                    Hero(
                      tag: 'current_weather',
                      child: CurrentWeatherWidget(entity: entity),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _detailsContainer(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailsContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: DetailsContainer(
        title: 'details',
        children: [
          DetailsItem(
            icon: Icons.thermostat,
            title: 'feels like ',
            value: tempSelector(
                cTemp: entity.current.feelsLikeC,
                fTemp: entity.current.feelsLikeF),
          ),
          const Divider(),
          DetailsItem(
            icon: Icons.air,
            title: 'wind speed',
            value: speedSelector(
                kmSpeed: entity.current.windKph,
                mileSpeed: entity.current.windMph),
          ),
          const Divider(),
          DetailsItem(
            title: 'wind degree',
            value: entity.current.windDegree,
            icon: Icons.directions,
          ),
          const Divider(),
          DetailsItem(
            title: 'wind direction',
            value: entity.current.windDir,
            icon: Icons.sync,
          ),
          const Divider(),
          DetailsItem(
            title: 'cloud',
            value: entity.current.cloud,
            icon: Icons.cloud,
          ),
          const Divider(),
          DetailsItem(
            title: 'humidity',
            value: entity.current.humidity,
            icon: Icons.water_drop,
          ),
          const Divider(),
          DetailsItem(
            title: 'pressure',
            value: '${entity.current.pressureIn} inch',
            icon: Icons.compress,
          ),
          const Divider(),
          DetailsItem(
            title: 'gust',
            value: speedSelector(
                kmSpeed: entity.current.gustKph,
                mileSpeed: entity.current.gustMph),
            icon: Icons.water,
          ),
          const Divider(),
          DetailsItem(
            title: 'visibility',
            value: speedSelector(
                kmSpeed: entity.current.visKm,
                mileSpeed: entity.current.visMiles),
            icon: Icons.visibility,
          ),
          const Divider(),
          DetailsItem(
            title: 'uv',
            value: entity.current.uv,
            icon: Icons.ac_unit,
          ),
        ],
      ),
    );
  }
}
