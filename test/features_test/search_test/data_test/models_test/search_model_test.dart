import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:taqs/features/search/data/models/search_model.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  const SearchModel testModel = SearchModel(
      id: 1,
      name: 'testName',
      region: 'testRegion',
      country: 'testCountry',
      lat: 1.0,
      lon: 1.0,
      url: 'testURL');

  Map<String, dynamic> testMap =
      json.decode(fixtureReader('search_response.json'));

  test('should return testModel when call fromJson function', () {
    final result = SearchModel.fromJson(testMap);
    expect(result, testModel);
  });

  test('should return testMap when call toJson function', () {
    final result = testModel.toJson();
    expect(result, testMap);
  });
}
