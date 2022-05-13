import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/features/search/domain/entities/search_entity_list.dart';
import 'package:taqs/features/search/domain/usecases/search_usecase.dart';
import 'package:taqs/features/search/presentation/logic/search_cubit/search_states/search_states.dart';

import '../../../../../core/errors/failures.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit({required this.usecase}) : super(SearchStates.initial());

  final SearchUsecase usecase;

  void search({required String q}) async {
    emit(SearchStates.loading());
    final result = await usecase(SearchParams(q));
    result.fold(
      (Failure failure) => emit(SearchStates.error(failure.message)),
      (SearchEntityList list) {
        emit(
          SearchStates.success(list),
        );
      },
    );
  }
}
