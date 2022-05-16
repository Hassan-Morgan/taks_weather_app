import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_states.freezed.dart';

@Freezed()
class SettingsStates with _$SettingsStates {
  factory SettingsStates.initial() = _initial;

  factory SettingsStates.error(String error) = _error;

  factory SettingsStates.success(String message) = _sucess;
}
