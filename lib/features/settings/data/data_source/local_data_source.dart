import 'package:dartz/dartz.dart';
import 'package:taqs/core/errors/exceptions.dart';

import '../../../../core/constants/app_constants.dart';
import '../models/settings_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<Either<Exception, SettingsModel>> getSettingsData();

  Future<Either<Exception, void>> setSettingsData({
    required String key,
    required bool value,
  });
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<Either<Exception, SettingsModel>> getSettingsData() async {
    try {
      final bool? isFTemp = sharedPreferences.getBool(isFTempKey);
      final bool? isMile = sharedPreferences.getBool(isMileKey);

      final SettingsModel model = SettingsModel(
        isFTemp: isFTemp ?? false,
        isMile: isMile ?? false,
      );
      return Right(model);
    } catch (e) {
      return Left(CashException());
    }
  }

  @override
  Future<Either<Exception, void>> setSettingsData(
      {required String key, required bool value}) async {
    try {
      final bool response = await sharedPreferences.setBool(key, value);
      if (response) {
        return const Right(null);
      }
      return Left(CashException());
    } catch (e) {
      return Left(CashException());
    }
  }
}
