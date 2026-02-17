import 'package:dio/dio.dart';

class UnauthorizedException extends DioException {
  UnauthorizedException({
    required super.requestOptions,
    required super.response,
    super.error,
    String? message,
  }) : super(
    type: DioExceptionType.badResponse,
    message: message ?? 'Not authorized (401)',
  );

  factory UnauthorizedException.fromDio(DioException e) {
    return UnauthorizedException(
      requestOptions: e.requestOptions,
      response: e.response ??
          Response(
            requestOptions: e.requestOptions,
            statusCode: 401,
          ),
      error: e.error,
      message: e.message,
    );
  }
}