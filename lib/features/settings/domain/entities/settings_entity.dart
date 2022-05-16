import 'package:equatable/equatable.dart';

class SettingsEntity extends Equatable {
  final bool isFTemp;
  final bool isMile;

  const SettingsEntity({
    required this.isFTemp,
    required this.isMile,
  });

  @override
  List<Object?> get props => [isFTemp, isMile];
}
