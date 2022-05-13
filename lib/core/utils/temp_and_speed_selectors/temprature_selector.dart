import '../../constants/app_constants.dart';

String tempSelector({required double cTemp,required double fTemp}) {
  if (isFTemp) {
    return '${fTemp.toInt()} F';
  }
  return '${cTemp.toInt()} c';
}
