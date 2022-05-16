import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:taqs/core/errors/failures.dart';

import '../../../../core/use_cases/use_case.dart';
import '../repositories/settings_repository.dart';

class SetSettingsDataUseCase extends UseCase<void, SettingsDataParams> {
  final SettingsRepository repository;

  SetSettingsDataUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(SettingsDataParams params) async {
    return await repository.setSettingsData(params.key, params.value);
  }
}

class SettingsDataParams extends Equatable {
  final String key;
  final bool value;

  const SettingsDataParams({required this.key, required this.value});

  @override
  List<Object?> get props => [key, value];
}
