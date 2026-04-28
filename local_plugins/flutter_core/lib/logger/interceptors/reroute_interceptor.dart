import 'package:dio/dio.dart';
import 'package:flutter_core/api/exceptions/exceptions.dart';
import 'package:flutter_core/api/extensions/extensions.dart';
import 'package:flutter_core/logger/logger.dart';
import 'package:talker/talker.dart';

class RerouteInterceptor implements InterceptorsWrapper {
  final Talker talker;
  final String clientName;
  int requestNumber;
  static const int _maxLoggedPayloadLength = 4000;

  RerouteInterceptor(this.talker, this.clientName) : requestNumber = 0;

  @override
  void onError(DioException exception, ErrorInterceptorHandler handler) {
    talker.error(_buildErrorMessage(exception), exception);

    if (exception.response?.unauthorized ?? false) {
      handler.reject(UnauthorizedException.fromDio(exception));
      return;
    }
    if (exception.response?.clientError ?? false) {
      handler.reject(ClientErrorException.fromDio(exception));
      return;
    }
    if (exception.response?.serverError ?? false) {
      handler.reject(ServerErrorException.fromDio(exception));
      return;
    }

    handler.reject(exception);
  }

  @override
  void onRequest(RequestOptions request, RequestInterceptorHandler handler) {
    talker.logCustom(
      RequestLog(
        clientName: clientName,
        url: request.uri.toString(),
        method: request.method,
        number: requestNumber,
      ),
    );
    requestNumber++;
    handler.next(request);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  String _buildErrorMessage(DioException exception) {
    final request = exception.requestOptions;
    final response = exception.response;
    final buffer = StringBuffer()
      ..writeln(exception.message ?? exception.type.name)
      ..writeln('Request: ${request.method} ${request.uri}');

    if (request.queryParameters.isNotEmpty) {
      buffer.writeln('Query: ${_formatPayload(request.queryParameters)}');
    }

    if (response == null) {
      return buffer.toString().trimRight();
    }

    buffer.writeln(
      'Response: ${response.statusCode ?? '-'} ${response.statusMessage ?? ''}'
          .trimRight(),
    );

    final responseData = _formatPayload(response.data);
    if (responseData.isNotEmpty) {
      buffer
        ..writeln('Response data:')
        ..write(responseData);
    }

    return buffer.toString().trimRight();
  }

  String _formatPayload(Object? payload) {
    if (payload == null) {
      return '';
    }

    final text = payload.toString();
    if (text.length <= _maxLoggedPayloadLength) {
      return text;
    }

    return '${text.substring(0, _maxLoggedPayloadLength)}... '
        '[truncated ${text.length - _maxLoggedPayloadLength} chars]';
  }
}
