import 'package:equatable/equatable.dart';

class AstroEntity extends Equatable {
  const AstroEntity({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonSet,
    required this.moonPhase,
    required this.moonIllumination,
  });

   final String sunrise;
   final String sunset;
   final String moonrise;
   final String moonSet;
   final String moonPhase;
   final String moonIllumination;

  @override
  List<Object?> get props =>
      [sunrise, sunrise, moonrise, moonSet, moonPhase, moonIllumination];
}
