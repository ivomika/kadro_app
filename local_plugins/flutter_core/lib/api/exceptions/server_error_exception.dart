import 'package:dio/dio.dart';

class ServerErrorException extends DioException {
  ServerErrorException({
    required super.requestOptions,
    required super.response,
    super.error,
    String? message,
  }) : super(
    type: DioExceptionType.badResponse,
    message: message ?? 'Server Error (500)',
  );

  factory ServerErrorException.fromDio(DioException e) {
    return ServerErrorException(
      requestOptions: e.requestOptions,
      response: e.response ??
          Response(
            requestOptions: e.requestOptions,
            statusCode: 500,
          ),
      error: e.error,
      message: e.message,
    );
  }
}