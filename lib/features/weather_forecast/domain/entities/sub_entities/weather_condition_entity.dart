import 'package:equatable/equatable.dart';

class WeatherConditionEntity extends Equatable {
  const WeatherConditionEntity({
    required this.text,
    required this.icon,
  });

  final String text;
  final String icon;

  @override
  List<Object?> get props => [
        text,
        icon,
      ];
}
