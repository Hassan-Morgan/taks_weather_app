import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taqs/core/constants/app_constants.dart';
import 'package:taqs/core/errors/exceptions.dart';
import 'package:taqs/features/settings/data/data_source/local_data_source.dart';
import 'package:taqs/features/settings/data/models/settings_data_model.dart';

import 'local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late MockSharedPreferences sharedPreferences;
  late LocalDataSource dataSource;

  setUp(
    () {
      sharedPreferences = MockSharedPreferences();
      dataSource = LocalDataSourceImpl(sharedPreferences);
    },
  );

  const trueSettingsTestModel = SettingsModel(isFTemp: true, isMile: true);
  const falseSettingsTestModel = SettingsModel(isFTemp: false, isMile: false);

  group(
    'getSettingsData',
    () {
      test(
        'should return SettingsModel with true values when call the function and the data is not null and no errors happen',
        () async {
          when(sharedPreferences.getBool(any)).thenReturn(true);
          final result = await dataSource.getSettingsData();
          expect(result, const Right(trueSettingsTestModel));
          verify(sharedPreferences.getBool(isFTempKey));
          verify(sharedPreferences.getBool(isMileKey));
        },
      );

      test(
        'should return SettingsModel with false values when call the function and the data is null and no errors happen',
        () async {
          when(sharedPreferences.getBool(any)).thenReturn(null);
          final result = await dataSource.getSettingsData();
          expect(result, const Right(falseSettingsTestModel));
          verify(sharedPreferences.getBool(isFTempKey));
          verify(sharedPreferences.getBool(isMileKey));
        },
      );

      test(
        'should return CashException when call the function and errors happen',
        () async {
          when(sharedPreferences.getBool(any)).thenThrow(Exception());
          final result = await dataSource.getSettingsData();
          expect(result, Left(CashException()));
        },
      );
    },
  );

  group(
    'setSettingsData',
    () {
      test(
        'should return right when call the function and set value return true and no error happen',
        () async {
          when(sharedPreferences.setBool(any, any))
              .thenAnswer((realInvocation) async => true);
          final result =
              await dataSource.setSettingsData(key: 'test key', value: true);
          expect(result, const Right(null));
          verify(sharedPreferences.setBool('test key', true));
        },
      );

      test(
        'should return CashException when call the function and set value return false',
        () async {
          when(sharedPreferences.setBool(any, any))
              .thenAnswer((realInvocation) async => false);
          final result =
              await dataSource.setSettingsData(key: 'test key', value: true);
          expect(result, Left(CashException()));
          verify(sharedPreferences.setBool('test key', true));
        },
      );

      test(
        'should return CashException when call the function and exception thrown',
        () async {
          when(sharedPreferences.setBool(any, any)).thenThrow(Exception());
          final result =
              await dataSource.setSettingsData(key: 'test key', value: true);
          expect(result, Left(CashException()));
          verify(sharedPreferences.setBool('test key', true));
        },
      );
    },
  );
}
