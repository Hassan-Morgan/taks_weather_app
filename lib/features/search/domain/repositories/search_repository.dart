import 'package:dartz/dartz.dart';
import 'package:taqs/features/search/domain/entities/search_entity_list.dart';

import '../../../../core/errors/failures.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchEntityList>> search(String q);
}
