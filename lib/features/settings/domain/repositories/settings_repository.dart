import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/settings_entity.dart';

abstract class SettingsRepository {
  Future<Either<Failure, SettingsEntity>> getSettingsData();

  Future<Either<Failure, void>> setSettingsData(String key, bool value);
}
