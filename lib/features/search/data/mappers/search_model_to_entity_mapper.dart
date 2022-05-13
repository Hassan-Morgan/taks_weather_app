import 'package:taqs/features/search/data/models/search_model.dart';
import 'package:taqs/features/search/domain/entities/search_entity.dart';

extension SearchToEntity on SearchModel {
  SearchEntity toEntity() => SearchEntity(
        name: name,
        country: country,
        region: region,
      );
}
