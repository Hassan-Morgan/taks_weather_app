import 'package:flutter_test/flutter_test.dart';
import 'package:taqs/features/settings/data/mappers/settings_to_entity.dart';
import 'package:taqs/features/settings/data/models/settings_data_model.dart';
import 'package:taqs/features/settings/domain/entities/settings_entity.dart';

void main() {
  const SettingsModel testModel = SettingsModel(isFTemp: true, isMile: true);
  const SettingsEntity testEntity = SettingsEntity(isFTemp: true, isMile: true);

  test(
    'should return SettingsEntity when call toEntity extension on SettingsModel',
    () {
      final result = testModel.toEntity();
      expect(result, testEntity);
    },
  );
}
