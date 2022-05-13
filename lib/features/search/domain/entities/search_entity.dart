import 'package:equatable/equatable.dart';

class SearchEntity extends Equatable {
  final String name;
  final String region;
  final String country;

  const SearchEntity({
    required this.name,
    required this.country,
    required this.region,
  });

  @override
  List<Object?> get props => [name,region,country];
}
