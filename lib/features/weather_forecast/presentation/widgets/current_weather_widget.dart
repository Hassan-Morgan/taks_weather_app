import 'package:flutter/material.dart';
import 'package:taqs/features/weather_forecast/domain/entities/weather_entity.dart';

import '../../../../core/presentation/resources/color_manager.dart';
import '../../../../core/utils/temp_and_speed_selectors/temperature_selector.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherEntity entity;

  const CurrentWeatherWidget({Key? key, required this.entity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on,
              color: ColorManager.redColor,
              size: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entity.location.name,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    entity.location.country,
                    style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tempSelector(
                  cTemp: entity.current.tempC, fTemp: entity.current.tempF),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.network(
              'https:${entity.current.condition.icon}',
            ),
          ],
        ),
        Text(
          entity.current.condition.text,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Max:${tempSelector(cTemp: entity.forecast[0].day.maxTempC!, fTemp: entity.forecast[0].day.maxTempF)} / Min:${tempSelector(cTemp: entity.forecast[0].day.minTempC!, fTemp: entity.forecast[0].day.minTempF!)} ',
          style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
