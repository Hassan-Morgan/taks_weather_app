class ServerException implements Exception {
  final int exceptionCode;

  const ServerException(this.exceptionCode);
}