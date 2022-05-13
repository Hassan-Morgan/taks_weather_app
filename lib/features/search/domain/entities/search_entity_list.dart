import 'package:equatable/equatable.dart';
import 'package:taqs/features/search/domain/entities/search_entity.dart';

class SearchEntityList extends Equatable {
  final List<SearchEntity> searchEntity;

  const SearchEntityList(this.searchEntity);

  @override
  List<Object?> get props => [searchEntity];
}
