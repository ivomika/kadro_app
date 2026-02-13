import 'package:dio/dio.dart';

class ClientErrorException extends DioException {
  ClientErrorException({
    required super.requestOptions,
    required super.response,
    super.error,
    String? message,
  }) : super(
    type: DioExceptionType.badResponse,
    message: message ?? 'Client Error (400)',
  );

  factory ClientErrorException.fromDio(DioException e) {
    return ClientErrorException(
      requestOptions: e.requestOptions,
      response: e.response ??
          Response(
            requestOptions: e.requestOptions,
            statusCode: 400,
          ),
      error: e.error,
      message: e.message,
    );
  }
}