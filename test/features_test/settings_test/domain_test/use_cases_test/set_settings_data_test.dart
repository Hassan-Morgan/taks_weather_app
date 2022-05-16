import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:taqs/core/errors/failures.dart';
import 'package:taqs/features/settings/domain/usecases/set_settings_data.dart';

import 'get_settings_data_test.mocks.dart';

void main() {
  late SetSettingsDataUseCase useCase;
  late MockSettingsRepository repository;

  setUp(
    () {
      repository = MockSettingsRepository();
      useCase = SetSettingsDataUseCase(repository);
    },
  );

  const testParams = SettingsDataParams(key: 'test', value: true);

  test(
    'should not return failure when call the function and no errors happen',
    () async {
      when(repository.setSettingsData(any, any))
          .thenAnswer((realInvocation) async => const Right(null));
      final result = await useCase(testParams);
      expect(result, const Right(null));
      verify(repository.setSettingsData('test', true));
    },
  );

  test('should  return failure when call the function and  errors happen',
      () async {
    when(repository.setSettingsData(any, any)).thenAnswer(
        (realInvocation) async => const Left(CashFailure('test message')));
    final result = await useCase(testParams);
    expect(result, const Left(CashFailure('test message')));
    verify(repository.setSettingsData('test', true));
  });
}
