import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/core/presentation/shared_widgets/error.dart';
import 'package:taqs/core/presentation/shared_widgets/loading.dart';
import 'package:taqs/features/search/presentation/logic/search_weather_cubit/search_weather_cubit.dart';
import 'package:taqs/features/search/presentation/logic/search_weather_cubit/search_weather_states/search_weather_states.dart';

import '../../../../injection.dart';
import '../../../weather_forecast/presentation/pages/home_page_sucess.dart';

class SearchWeatherPage extends StatelessWidget {
  final String cityName;

  const SearchWeatherPage({
    Key? key,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<SearchWeatherCubit>()..getWeatherByCityName(cityName),
      child: BlocBuilder<SearchWeatherCubit, SearchWeatherStates>(
        builder: (context, state) => state.maybeWhen(
          orElse: () => const SizedBox(),
          success: (entity) => Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            body: HomePageSuccess(
              entity: entity,
            ),
          ),
          loading: () => const LoadingPage(),
          error: (error) => ErrorPage(error: error, pageIndex: 2),
        ),
      ),
    );
  }
}
