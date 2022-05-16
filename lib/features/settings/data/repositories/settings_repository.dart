import 'package:dartz/dartz.dart';
import 'package:taqs/core/errors/failures.dart';
import 'package:taqs/features/settings/data/data_source/local_data_source.dart';
import 'package:taqs/features/settings/data/mappers/settings_to_entity.dart';
import 'package:taqs/features/settings/domain/entities/settings_entity.dart';
import 'package:taqs/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final LocalDataSource dataSource;

  SettingsRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, SettingsEntity>> getSettingsData() async {
    final result = await dataSource.getSettingsData();
    return result.fold(
      (l) => const Left(CashFailure('cash error happened')),
      (r) => Right(r.toEntity()),
    );
  }

  @override
  Future<Either<Failure, void>> setSettingsData(String key, bool value) async {
    final result = await dataSource.setSettingsData(key: key, value: value);
    return result.fold(
      (l) => const Left(CashFailure('cash error happened')),
      (r) => const Right(null),
    );
  }
}
