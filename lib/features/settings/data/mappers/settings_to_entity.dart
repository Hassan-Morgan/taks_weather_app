import 'package:taqs/features/settings/data/models/settings_data_model.dart';
import 'package:taqs/features/settings/domain/entities/settings_entity.dart';

extension SettingsToEntity on SettingsModel {
  SettingsEntity toEntity() => SettingsEntity(isFTemp: isFTemp, isMile: isMile);
}
