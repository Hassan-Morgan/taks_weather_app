import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taqs/core/errors/exceptions.dart';
import 'package:taqs/core/errors/failures.dart';
import 'package:taqs/features/settings/data/data_source/local_data_source.dart';
import 'package:taqs/features/settings/data/models/settings_data_model.dart';
import 'package:taqs/features/settings/data/repositories/settings_repository.dart';
import 'package:taqs/features/settings/domain/entities/settings_entity.dart';
import 'package:taqs/features/settings/domain/repositories/settings_repository.dart';

import 'settings_repository.mocks.dart';

@GenerateMocks([LocalDataSource])
void main() {
  late SettingsRepository repository;
  late MockLocalDataSource dataSource;

  setUp(
    () {
      dataSource = MockLocalDataSource();
      repository = SettingsRepositoryImpl(dataSource);
    },
  );
  const SettingsModel testModel = SettingsModel(isFTemp: true, isMile: true);
  const SettingsEntity testEntity = SettingsEntity(isFTemp: true, isMile: true);

  group(
    'getSettingsData',
    () {
      test(
        'should return SettingsEntity when call the function and no exception happen',
        () async {
          when(dataSource.getSettingsData())
              .thenAnswer((realInvocation) async => const Right(testModel));
          final result = await repository.getSettingsData();
          expect(result, const Right(testEntity));
          verify(dataSource.getSettingsData());
        },
      );

      test(
        'should return CashFailure when call the function and exception happen',
        () async {
          when(dataSource.getSettingsData())
              .thenAnswer((realInvocation) async => Left(CashException()));
          final result = await repository.getSettingsData();
          expect(result, const Left(CashFailure('cash error happened')));
          verify(dataSource.getSettingsData());
        },
      );
    },
  );

  group(
    'setSettingsData',
    () {
      test(
        'should return null when call the function and no errors happen',
        () async {
          when(dataSource.setSettingsData(
                  key: anyNamed('key'), value: anyNamed('value')))
              .thenAnswer((realInvocation) async => const Right(null));
          final result = await repository.setSettingsData('test', true);
          expect(result, const Right(null));
          verify(dataSource.setSettingsData(key: 'test', value: true));
        },
      );

      test(
        'should return null when call the function and no errors happen',
        () async {
          when(dataSource.setSettingsData(
                  key: anyNamed('key'), value: anyNamed('value')))
              .thenAnswer((realInvocation) async => Left(Exception()));
          final result = await repository.setSettingsData('test', true);
          expect(result, const Left(CashFailure('cash error happened')));
          verify(dataSource.setSettingsData(key: 'test', value: true));
        },
      );
    },
  );
}
