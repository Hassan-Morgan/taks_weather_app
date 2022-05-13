import 'package:flutter_test/flutter_test.dart';
import 'package:taqs/features/search/data/mappers/search_model_to_entity_mapper.dart';
import 'package:taqs/features/search/data/models/search_model.dart';
import 'package:taqs/features/search/domain/entities/search_entity.dart';

void main() {
  const SearchEntity testEntity = SearchEntity(
    name: 'testName',
    country: 'testCountry',
    region: 'testRegion',
  );

  const SearchModel testModel = SearchModel(
    id: 1,
    name: 'testName',
    region: 'testRegion',
    country: 'testCountry',
    lat: 1.0,
    lon: 1.0,
    url: 'testURL',
  );

  test(
      'should return SearchEntity when call the toEntity extension on SearchModel',
      () {
    final result = testModel.toEntity();

    expect(result, testEntity);
  });
}
