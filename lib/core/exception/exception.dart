class ServerException implements Exception {
  final String errorMessage;
  final int errorCode;

  ServerException({
    required this.errorMessage,
    required this.errorCode,
  });

  get message => "";

  get code => 0;

  @override
  String toString() =>
      'ServerExseption(errorMessage: $errorMessage, errorCode: $errorCode)';
}
