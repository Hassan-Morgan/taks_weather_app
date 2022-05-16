import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taqs/core/utils/temp_and_speed_selectors/temperature_selector.dart';
import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/astro_enitity.dart';
import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/day_weather_entity.dart';
import 'package:taqs/core/presentation/shared_widgets/details_container.dart';

import '../../../../core/presentation/shared_widgets/details_item.dart';

class DayDetailsPage extends StatelessWidget {
  final AstroEntity astro;
  final DayEntity day;

  const DayDetailsPage({
    Key? key,
    required this.astro,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _weather(),
                    const SizedBox(
                      height: 20,
                    ),
                    _astroDetails(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _weather() {
    return DetailsContainer(
      title: 'weather',
      children: [
        DetailsItem(
          icon: Icons.thermostat,
          title: 'max temp',
          value: tempSelector(
            cTemp: day.maxTempC!,
            fTemp: day.maxTempF,
          ),
        ),
        const Divider(),
        DetailsItem(
          icon: Icons.thermostat,
          title: 'min temp',
          value: tempSelector(
            cTemp: day.minTempC!,
            fTemp: day.minTempF!,
          ),
        ),
        const Divider(),
        DetailsItem(
          icon: Icons.thermostat,
          title: 'average temp',
          value: tempSelector(
            cTemp: day.avgTempC!,
            fTemp: day.avgTempF!,
          ),
        ),
        const Divider(),
        DetailsItem(
          icon: Icons.water_drop,
          title: 'rain chance',
          value: day.dailyChanceOfRain,
        ),
        const Divider(),
        DetailsItem(
          icon: Icons.cloudy_snowing,
          title: 'snowing chance',
          value: day.dailyChanceOfSnow,
        ),
      ],
    );
  }

  Widget _astroDetails() {
    return DetailsContainer(
      title: 'Astro',
      children: [
        DetailsItem(
          icon: Icons.wb_twilight,
          title: 'sunrise',
          value: astro.sunrise,
        ),
        const Divider(),
        DetailsItem(
          icon: Icons.wb_twilight,
          title: 'sunset',
          value: astro.sunset,
        ),
        const Divider(),
        DetailsItem(
          icon: Icons.nightlight,
          title: 'moonrise',
          value: astro.moonrise,
        ),
        const Divider(),
        DetailsItem(
          icon: Icons.nightlight,
          title: 'moonSet',
          value: astro.moonSet,
        ),
        const Divider(),
        DetailsItem(
          icon: Icons.brightness_3,
          title: 'moon phase',
          value: astro.moonPhase,
        ),
        const Divider(),
        DetailsItem(
          icon: Icons.brightness_4,
          title: 'moon illumination',
          value: astro.moonIllumination,
        ),
      ],
    );
  }
}
