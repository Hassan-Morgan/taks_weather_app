import '../../constants/app_constants.dart';

String speedSelector({required double kmSpeed, required double mileSpeed}) {
  if (isMileValue) {
    return '${mileSpeed.toInt()} MPH';
  }
  return '${kmSpeed.toInt()} KPH';
}