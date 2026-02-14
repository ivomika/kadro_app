import 'package:dio/dio.dart';
import 'package:flutter_core/api/client/base_api_client.dart';
import 'package:flutter_core/api/exception/client_error_exception.dart';
import 'package:flutter_core/api/exception/server_error_exception.dart';
import 'package:flutter_core/api/exception/unauthorized_exception.dart';
import 'package:flutter_core/api/extensions/response_extension.dart';
import 'package:flutter_core/logger/logs/request_log.dart';
import 'package:talker/talker.dart';

class RerouteInterceptor implements InterceptorsWrapper{
  final Talker talker;
  int requestNumber;

  RerouteInterceptor(this.talker) : requestNumber = 0;

  @override
  void onError(DioException exception, ErrorInterceptorHandler handler) {
    talker.error(exception.message, exception);

    if(exception.response?.unauthorized ?? false){
      handler.reject(UnauthorizedException.fromDio(exception));
      return;
    }
    if(exception.response?.clientError ?? false){
      handler.reject(ClientErrorException.fromDio(exception));
      return;
    }
    if(exception.response?.serverError ?? false){
      handler.reject(ServerErrorException.fromDio(exception));
      return;
    }

    handler.reject(exception);
  }

  @override
  void onRequest(RequestOptions request, RequestInterceptorHandler handler) {
    talker.logCustom(
        RequestLog<BaseApiClient>(
            url: request.uri.toString(),
            method: request.method,
            number: requestNumber
        )
    );
    requestNumber++;
    handler.next(request);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}