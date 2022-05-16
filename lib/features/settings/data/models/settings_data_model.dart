import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class SettingsModel extends Equatable {
  final bool isFTemp;
  final bool isMile;

  const SettingsModel({
    required this.isFTemp,
    required this.isMile,
  });

  @override
  List<Object?> get props => [
        isFTemp,
        isMile,
      ];
}
