import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taqs/features/search/domain/entities/search_entity_list.dart';

part 'search_states.freezed.dart';

@Freezed()
class SearchStates with _$SearchStates {
  factory SearchStates.initial() = _initial;

  factory SearchStates.loading() = _loading;

  factory SearchStates.error(String error) = _error;

  factory SearchStates.success(SearchEntityList entity) = _success;
}
