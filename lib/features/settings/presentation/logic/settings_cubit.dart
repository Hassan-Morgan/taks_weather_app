import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/core/use_cases/use_case.dart';
import 'package:taqs/features/settings/domain/usecases/get_settings_data.dart';
import 'package:taqs/features/settings/domain/usecases/set_settings_data.dart';
import 'package:taqs/features/settings/presentation/logic/settings_cubit_states/settings_states.dart';

import '../../../../core/constants/app_constants.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit({
    required this.getUsecase,
    required this.setUsecase,
  }) : super(SettingsStates.initial());

  final GetSettingsDataUseCase getUsecase;
  final SetSettingsDataUseCase setUsecase;

  void getSettingsData() async {
    emit(SettingsStates.initial());
    final result = await getUsecase(NoParams());
    result.fold(
      (l) {
        emit(SettingsStates.error(l.message));
      },
      (r) {
        isFTempValue = r.isFTemp;
        isMileValue = r.isMile;
      },
    );
  }

  void setSettingsData({required String key, required bool value}) async {
    emit(SettingsStates.initial());
    final result = await setUsecase(SettingsDataParams(key: key, value: value));
    result.fold(
      (l) => emit(SettingsStates.error(l.message)),
      (r) {
        if (key == isFTempKey) {
          isFTempValue = value;
        } else if (key == isMileKey) {
          isMileValue = value;
        }
        emit(SettingsStates.success('changed successfully'));
      },
    );
  }
}
