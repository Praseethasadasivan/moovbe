class CustomException implements Exception {
  CustomException({
    this.message = 'Something went wrong',
    this.response,
    this.statusCode,
  });
  final String? message;
  final dynamic response;
  final int? statusCode;
}
