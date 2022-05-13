import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/features/search/presentation/pages/search_page.dart';
import 'package:taqs/features/weather_forecast/presentation/logic/weather_forecast_cubit.dart';

import 'custom_button.dart';

class ErrorPage extends StatelessWidget {
  final String error;
  final int pageIndex;

  const ErrorPage({
    Key? key,
    required this.error,
    required this.pageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cloud_off,
            size: 100,
            color: Theme.of(context).primaryColor,
          ),
          Text(
            error,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            onPressed: () {
              if (pageIndex == 1) {
                BlocProvider.of<WeatherForecastCubit>(context)
                    .getWeatherForecastWithLocation();
              } else if (pageIndex == 2) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ));
              }
            },
            buttonName: 'Retry',
          ),
        ],
      ),
    );
  }
}
