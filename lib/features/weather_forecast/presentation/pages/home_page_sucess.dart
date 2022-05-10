import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/core/presentation/resources/color_manager.dart';
import 'package:taqs/core/presentation/shared_widgets/custom_button.dart';
import 'package:taqs/core/utils/temp_speed_selectors/temprature_selector.dart';
import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/hourly_weather_entity.dart';
import 'package:taqs/features/weather_forecast/domain/entities/weather_entity.dart';
import 'package:taqs/features/weather_forecast/presentation/logic/weather_forecast_cubit.dart';
import 'package:taqs/features/weather_forecast/presentation/pages/current_weather_details.dart';
import 'package:taqs/features/weather_forecast/presentation/widgets/current_weather_widget.dart';

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
                  details: entity.forecast[0].hour,
                  title: 'Today',
                  context: context,
                ),
                const SizedBox(
                  height: 20,
                ),
                _daysWeather(
                  title: 'Tomorrow',
                  details: entity.forecast[1].hour,
                  context: context,
                ),
                const SizedBox(
                  height: 20,
                ),
                _daysWeather(
                  title: 'After Tomorrow',
                  details: entity.forecast[2].hour,
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
    required List details,
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
              onPressed: () {},
              child: const Text(
                'full details',
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
              details[index],
              context,
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              width: 10,
            ),
            itemCount: details.length,
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
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
