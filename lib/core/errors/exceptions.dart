import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final int exceptionCode;

  const ServerException(this.exceptionCode);

  @override
  List<Object?> get props => [exceptionCode];
}
