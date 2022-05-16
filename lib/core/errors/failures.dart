import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}

class RequestServicesFailure extends Failure {
  const RequestServicesFailure(String message) : super(message);
}

class GetPermissionFailure extends Failure {
  const GetPermissionFailure(String message) : super(message);
}

class CashFailure extends Failure {
  const CashFailure(String message) : super(message);
}
