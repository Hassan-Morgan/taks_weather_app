import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/core/presentation/shared_widgets/error.dart';
import 'package:taqs/core/presentation/shared_widgets/loading.dart';
import 'package:taqs/features/search/presentation/logic/search_weather_cubit/search_weather_cubit.dart';
import 'package:taqs/features/search/presentation/logic/search_weather_cubit/search_weather_states/search_weather_states.dart';

import '../../../../injection.dart';
import '../../../weather_forecast/presentation/pages/home_page_sucess.dart';

class SearchWeatherPage extends StatefulWidget {
  final String cityName;

  const SearchWeatherPage({
    Key? key,
    required this.cityName,
  }) : super(key: key);

  @override
  State<SearchWeatherPage> createState() => _SearchWeatherPageState();
}

class _SearchWeatherPageState extends State<SearchWeatherPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchWeatherCubit>(context)
        .getWeatherByCityName(widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchWeatherCubit, SearchWeatherStates>(
      builder: (context, state) => state.maybeWhen(
        orElse: () => const SizedBox(),
        success: (entity) => Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          ),
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          body: HomePageSuccess(
            entity: entity,
          ),
        ),
        loading: () => const LoadingPage(),
        error: (error) => ErrorPage(error: error, pageIndex: 2),
      ),
    );
  }
}
