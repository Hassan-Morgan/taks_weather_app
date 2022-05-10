import '../../constants/app_constants.dart';

String speedSelector({required double kmSpeed, required double mileSpeed}) {
  if (isMileSpeed) {
    return '${mileSpeed.toInt()} MPH';
  }
  return '${kmSpeed.toInt()} KPH';
}