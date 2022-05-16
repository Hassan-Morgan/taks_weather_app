import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/core/constants/app_constants.dart';
import 'package:taqs/core/presentation/resources/color_manager.dart';
import 'package:taqs/core/presentation/shared_widgets/details_item.dart';
import 'package:taqs/features/settings/presentation/logic/settings_cubit.dart';
import 'package:taqs/features/settings/presentation/logic/settings_cubit_states/settings_states.dart';
import 'package:taqs/features/weather_forecast/presentation/logic/weather_forecast_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsStates>(
        listener: (context, state) {
      state.whenOrNull(success: (message) {
        BlocProvider.of<WeatherForecastCubit>(context)
            .getWeatherForecastWithLocation();
        ScaffoldMessenger.of(context).showSnackBar(
          _customSnackBar(message, Colors.green),
        );
      }, error: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          _customSnackBar(error, Colors.red),
        );
      });
    }, builder: (context, state) {
      final cubit = BlocProvider.of<SettingsCubit>(context);
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              ExpansionTile(
                title: DetailsItem(
                  icon: Icons.thermostat,
                  title: 'temp type',
                  value: isFTempValue ? ' Fahrenheit/F' : ' Celsius/C',
                ),
                collapsedIconColor: Theme.of(context).primaryColor,
                children: [
                  _singleItemSelector(
                    context: context,
                    onTap: () {
                      cubit.setSettingsData(
                        key: isFTempKey,
                        value: true,
                      );
                    },
                    title: 'Fahrenheit/F',
                    color: isFTempValue
                        ? ColorManager.redColor
                        : ColorManager.lightGreyColor,
                  ),
                  _singleItemSelector(
                    context: context,
                    onTap: () {
                      cubit.setSettingsData(
                        key: isFTempKey,
                        value: false,
                      );
                    },
                    title: 'Celsius/C',
                    color: isFTempValue
                        ? ColorManager.lightGreyColor
                        : ColorManager.redColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ExpansionTile(
                title: DetailsItem(
                  icon: Icons.straighten,
                  title: 'length type',
                  value: isMileValue ? ' Mile' : ' KiloMeter',
                ),
                collapsedIconColor: Theme.of(context).primaryColor,
                children: [
                  _singleItemSelector(
                    context: context,
                    onTap: () {
                      cubit.setSettingsData(
                        key: isMileKey,
                        value: true,
                      );
                    },
                    title: 'Mile',
                    color: isMileValue
                        ? ColorManager.redColor
                        : ColorManager.lightGreyColor,
                  ),
                  _singleItemSelector(
                    context: context,
                    onTap: () {
                      cubit.setSettingsData(
                        key: isMileKey,
                        value: false,
                      );
                    },
                    title: 'KiloMeter',
                    color: isMileValue
                        ? ColorManager.lightGreyColor
                        : ColorManager.redColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _singleItemSelector({
    required BuildContext context,
    required void Function() onTap,
    required String title,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            CircleAvatar(
              radius: 6,
              backgroundColor: ColorManager.whiteColor,
              child: CircleAvatar(
                radius: 5,
                backgroundColor: color,
              ),
            )
          ],
        ),
      ),
    );
  }

  SnackBar _customSnackBar(final String message, final Color color) {
    return SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: ColorManager.whiteColor,
        ),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 1),
    );
  }
}
