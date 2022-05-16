import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taqs/core/errors/failures.dart';
import 'package:taqs/core/use_cases/use_case.dart';
import 'package:taqs/features/settings/domain/entities/settings_entity.dart';
import 'package:taqs/features/settings/domain/repositories/settings_repository.dart';
import 'package:taqs/features/settings/domain/usecases/get_settings_data.dart';

import 'get_settings_data_test.mocks.dart';

@GenerateMocks([SettingsRepository])
void main() {
  late GetSettingsDataUseCase useCase;
  late MockSettingsRepository repository;

  setUp(
    () {
      repository = MockSettingsRepository();
      useCase = GetSettingsDataUseCase(repository);
    },
  );

  final SettingsEntity testEntity = SettingsEntity(isFTemp: true, isMile: true);

  test(
    'should return SettingsEntity when call the function and no errors happen',
    () async {
      when(repository.getSettingsData())
          .thenAnswer((realInvocation) async => Right(testEntity));

      final result = await useCase(NoParams());
      expect(result, Right(testEntity));
      verify(repository.getSettingsData());
    },
  );

  test(
    'should return Failure when call the function and error happen',
    () async {
      when(repository.getSettingsData()).thenAnswer(
          (realInvocation) async => const Left(CashFailure('test message')));

      final result = await useCase(NoParams());
      expect(result, const Left(CashFailure('test message')));
      verify(repository.getSettingsData());
    },
  );
}
