import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taqs/core/constants/app_constants.dart';
import 'package:taqs/core/errors/failures.dart';
import 'package:taqs/core/use_cases/use_case.dart';
import 'package:taqs/features/settings/domain/entities/settings_entity.dart';
import 'package:taqs/features/settings/domain/usecases/get_settings_data.dart';
import 'package:taqs/features/settings/domain/usecases/set_settings_data.dart';
import 'package:taqs/features/settings/presentation/logic/settings_cubit.dart';
import 'package:taqs/features/settings/presentation/logic/settings_cubit_states/settings_states.dart';

import 'settings_cubit_test.mocks.dart';

@GenerateMocks([SetSettingsDataUseCase, GetSettingsDataUseCase])
void main() {
  late SettingsCubit cubit;
  late MockSetSettingsDataUseCase setUseCase;
  late MockGetSettingsDataUseCase getUseCase;

  setUp(
    () {
      setUseCase = MockSetSettingsDataUseCase();
      getUseCase = MockGetSettingsDataUseCase();
      cubit = SettingsCubit(getUsecase: getUseCase, setUsecase: setUseCase);
    },
  );

  test(
    'initial state should be SettingsStates.initial',
    () {
      expect(cubit.state, SettingsStates.initial());
    },
  );

  const SettingsEntity testEntity = SettingsEntity(isFTemp: true, isMile: true);

  group(
    'getSettingsData',
    () {
      test(
        'when call the getSettingsState it should set the isFTemp and isMile constants to the settingsData values',
        () async {
          when(getUseCase(any))
              .thenAnswer((realInvocation) async => const Right(testEntity));
          cubit.getSettingsData();
          await untilCalled(getUseCase(any));
          expect(isFTempValue, true);
          expect(isMileValue, true);
          verify(getUseCase(NoParams()));
        },
      );

      test(
        'when call the getSettingsState and failure happen it should set the state to SettingsState.error',
        () async {
          when(getUseCase(any)).thenAnswer((realInvocation) async =>
              const Left(CashFailure('test message')));
          cubit.getSettingsData();
          expect(cubit.state, SettingsStates.initial());
          await untilCalled(getUseCase(any));
          expect(cubit.state, SettingsStates.error('test message'));
          verify(getUseCase(NoParams()));
        },
      );
    },
  );

  group(
    'setSettingsData',
    () {
      test(
        'when call the function and no errors happen it should set the state to SettingsStates.success',
        () async {
          when(setUseCase(any))
              .thenAnswer((realInvocation) async => const Right(null));
          cubit.setSettingsData(key: isFTempKey, value: true);
          expect(cubit.state, SettingsStates.initial());
          await untilCalled(setUseCase(any));
          expect(cubit.state, SettingsStates.success('changed successfully'));
          expect(isFTempValue, true);
          verify(setUseCase(
              const SettingsDataParams(key: isFTempKey, value: true)));
        },
      );

      test(
        'when call the function and error happen it should set the state to SettingsStates.error',
        () async {
          when(setUseCase(any)).thenAnswer((realInvocation) async =>
              const Left(CashFailure('test message')));
          cubit.setSettingsData(key: 'test key', value: true);
          expect(cubit.state, SettingsStates.initial());
          await untilCalled(setUseCase(any));
          expect(cubit.state, SettingsStates.error('test message'));
          verify(setUseCase(
              const SettingsDataParams(key: 'test key', value: true)));
        },
      );
    },
  );
}
