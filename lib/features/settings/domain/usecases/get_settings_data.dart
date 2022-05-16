import 'package:dartz/dartz.dart';
import 'package:taqs/core/errors/failures.dart';
import 'package:taqs/features/settings/domain/entities/settings_entity.dart';
import 'package:taqs/features/settings/domain/repositories/settings_repository.dart';

import '../../../../core/use_cases/use_case.dart';

class GetSettingsDataUseCase extends UseCase<SettingsEntity, NoParams> {
  final SettingsRepository repository;

  GetSettingsDataUseCase(this.repository);

  @override
  Future<Either<Failure, SettingsEntity>> call(NoParams params) async {
    return await repository.getSettingsData();
  }
}
