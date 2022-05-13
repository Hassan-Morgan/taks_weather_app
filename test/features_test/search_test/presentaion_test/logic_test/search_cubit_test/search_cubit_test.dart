import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taqs/core/errors/failures.dart';
import 'package:taqs/features/search/domain/entities/search_entity.dart';
import 'package:taqs/features/search/domain/entities/search_entity_list.dart';
import 'package:taqs/features/search/domain/usecases/search_usecase.dart';
import 'package:taqs/features/search/presentation/logic/search_cubit/search_cubit.dart';
import 'package:taqs/features/search/presentation/logic/search_cubit/search_states/search_states.dart';

import 'search_cubit_test.mocks.dart';

@GenerateMocks([SearchUsecase])
void main() {
  late MockSearchUsecase searchUsecase;
  late SearchCubit searchCubit;

  setUp(
    () {
      searchUsecase = MockSearchUsecase();
      searchCubit = SearchCubit(usecase: searchUsecase);
    },
  );

  const SearchEntityList testEntity = SearchEntityList(
    [
      SearchEntity(
        name: 'testName',
        region: 'testRegion',
        country: 'testCountry',
      )
    ],
  );

  test('init state should be initialState', () {
    final result = searchCubit.state;
    expect(result, SearchStates.initial());
  });

  test(
    '''should set state to success state with searchEntityList when call search function and no errors happen
      and change state from init to loading to success''',
    () async {
      when(searchUsecase(any))
          .thenAnswer((realInvocation) async => const Right(testEntity));

      searchCubit.search(q: 'test');
      expect(searchCubit.state, SearchStates.loading());
      await untilCalled(searchUsecase(any));
      expect(searchCubit.state, SearchStates.success(testEntity));
      verify(searchUsecase(const SearchParams('test')));
    },
  );

  test(
    '''should set state to error stat when call search function and errors happen 
    and change state from init to loading to error''',
    () async {
      when(searchUsecase(any)).thenAnswer(
          (realInvocation) async => const Left(ServerFailure('test message')));

      searchCubit.search(q: 'test');
      expect(searchCubit.state, SearchStates.loading());
      await untilCalled(searchUsecase(any));
      expect(searchCubit.state, SearchStates.error('test message'));
      verify(searchUsecase(const SearchParams('test')));
    },
  );
}
