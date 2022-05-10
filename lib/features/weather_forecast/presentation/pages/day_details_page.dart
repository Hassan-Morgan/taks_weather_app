import 'package:flutter/material.dart';
import 'package:taqs/features/weather_forecast/domain/entities/sub_entities/astro_enitity.dart';

class DayDetailsPage extends StatelessWidget {
  final AstroEntity astro;

  const DayDetailsPage({Key? key, required this.astro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
