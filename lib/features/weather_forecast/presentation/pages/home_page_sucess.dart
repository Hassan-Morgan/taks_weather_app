import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/core/presentation/resources/color_manager.dart';
import 'package:taqs/core/presentation/shared_widgets/custom_button.dart';
import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/hourly_weather_entity.dart';
import 'package:taqs/features/weather_forecast/domain/entities/weather_entity.dart';
import 'package:taqs/features/weather_forecast/presentation/logic/weather_forecast_cubit.dart';
import 'package:taqs/features/weather_forecast/presentation/pages/current_weather_details.dart';
import 'package:taqs/features/weather_forecast/presentation/pages/day_details_page.dart';
import 'package:taqs/features/weather_forecast/presentation/widgets/current_weather_widget.dart';

import '../../../../core/utils/temp_and_speed_selectors/temprature_selector.dart';
import '../../domain/entities/sub_entities/forecast_entity.dart';

class HomePageSuccess extends StatelessWidget {
  final WeatherEntity entity;

  const HomePageSuccess({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<WeatherForecastCubit>(context)
              .getWeatherForecastWithLocation();
        },
        color: ColorManager.redColor,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Hero(
                  tag: 'current_weather',
                  child: CurrentWeatherWidget(entity: entity),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  CurrentWeatherDetails(entity: entity),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return ScaleTransition(
                              scale: animation,
                              child: child,
                            );
                          }),
                    );
                  },
                  buttonName: 'see current Weather details',
                ),
                const SizedBox(
                  height: 20,
                ),
                _daysWeather(
                  forecast: entity.forecast[0],
                  title: 'Today',
                  context: context,
                ),
                const SizedBox(
                  height: 20,
                ),
                _daysWeather(
                  title: 'Tomorrow',
                  forecast: entity.forecast[1],
                  context: context,
                ),
                const SizedBox(
                  height: 20,
                ),
                _daysWeather(
                  title: 'After Tomorrow',
                  forecast: entity.forecast[2],
                  context: context,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _daysWeather({
    required String title,
    required ForecastDayEntity forecast,
    required BuildContext context,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 22,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          DayDetailsPage(
                            astro: forecast.astro,
                            day: forecast.day,
                          ),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      }),
                );
              },
              child: const Text(
                'details',
                style: TextStyle(
                  color: ColorManager.redColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 160,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _weatherCard(
              forecast.hour[index],
              context,
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              width: 10,
            ),
            itemCount: forecast.hour.length,
          ),
        ),
      ],
    );
  }

  Widget _weatherCard(
      HourlyWeatherEntity hourlyWeatherEntity, BuildContext context) {
    final time = DateTime.parse(hourlyWeatherEntity.time);
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            '${time.hour}:00',
            style: TextStyle(
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
          Image.network('https:${hourlyWeatherEntity.condition.icon}'),
          Text(
            '${tempSelector(cTemp: hourlyWeatherEntity.tempC!, fTemp: hourlyWeatherEntity.tempF!)} ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            hourlyWeatherEntity.condition.text,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
