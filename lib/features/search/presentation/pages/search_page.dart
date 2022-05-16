import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/core/presentation/resources/color_manager.dart';
import 'package:taqs/core/presentation/shared_widgets/custom_button.dart';
import 'package:taqs/core/presentation/shared_widgets/error.dart';
import 'package:taqs/core/presentation/shared_widgets/loading.dart';
import 'package:taqs/features/search/domain/entities/search_entity_list.dart';
import 'package:taqs/features/search/presentation/logic/search_cubit/search_cubit.dart';
import 'package:taqs/features/search/presentation/logic/search_weather_cubit/search_weather_cubit.dart';
import 'package:taqs/features/search/presentation/pages/search_result_weather.dart';
import 'package:taqs/core/presentation/shared_widgets/details_container.dart';

import '../../../../core/presentation/shared_widgets/details_item.dart';
import '../../../../injection.dart';
import '../logic/search_cubit/search_states/search_states.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<SearchCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<SearchWeatherCubit>(),
        )
      ],
      child: BlocBuilder<SearchCubit, SearchStates>(
        builder: (context, state) => state.maybeWhen(
          orElse: () => _searchInitScreen(context),
          initial: () => _searchInitScreen(context),
          loading: () => const LoadingPage(),
          error: (error) => ErrorPage(
            error: error,
            pageIndex: 2,
          ),
          success: (list) => _successScreen(context, list),
        ),
      ),
    );
  }

  Widget _successScreen(BuildContext context, SearchEntityList list) {
    if (list.searchEntity.isEmpty) {
      return Column(
        children: [
          _searchInitScreen(context),
          Expanded(
            child: Center(
              child: Text(
                'there is no results',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ],
      );
    }
    return SafeArea(
      child: Column(
        children: [
          _searchInitScreen(context),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<SearchWeatherCubit>(context),
                        child: SearchWeatherPage(
                          cityName: list.searchEntity[index].name,
                        ),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DetailsContainer(
                    title: '${index + 1}',
                    children: [
                      DetailsItem(
                        icon: Icons.location_on,
                        title: 'location',
                        value: list.searchEntity[index].name,
                      ),
                      DetailsItem(
                        icon: Icons.location_city,
                        title: 'region',
                        value: list.searchEntity[index].region,
                      ),
                      DetailsItem(
                        icon: Icons.south_america,
                        title: 'country',
                        value: list.searchEntity[index].country,
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: list.searchEntity.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchInitScreen(context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  label: Text(
                    'enter your search',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                controller: controller,
                validator: (input) {
                  if (input!.length < 3) {
                    return 'input must be at least 3 character';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<SearchCubit>(context)
                        .search(q: controller.text);
                  }
                },
                buttonName: 'search'),
          ],
        ),
      ),
    );
  }
}
