import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_core/api/exception/client_error_exception.dart';
import 'package:flutter_core/api/exception/server_error_exception.dart';
import 'package:flutter_core/api/exception/unauthorized_exception.dart';
import 'package:flutter_core/api/extensions/response_extension.dart';
import 'package:flutter_core/api/fetchers/base_fetcher.dart';
import 'package:flutter_core/api/fetchers/upload_image_fetcher.dart';
import 'package:flutter_core/api/methods/request_method.dart';
import 'package:flutter_core/api/types/fetch_response.dart';
import 'package:flutter_core/api/types/response_mapper.dart';
import 'package:flutter_core/logger/interceptors/reroute_interceptor.dart';
import 'package:talker/talker.dart';

class BaseApiClient{
  final Talker _talker = Talker();
  final Dio _dioClient = Dio();
  final String baseUrl;
  BaseApiClient(this.baseUrl){
    _dioClient.options.baseUrl = baseUrl;
    _dioClient.interceptors.add(RerouteInterceptor(_talker));
  }

  FutureOr<FetchResponse<T>> fetch<T extends ResponseMapper>(
      RequestMethod method,
      String url,
      {
        Map<String, dynamic> queryParams = const {},
        Map<String, dynamic> body = const {},
        required T Function() creator
      }
  ) async => _processData(
      await _fetch(
        method.fetcher,
        url,
        queryParams: queryParams,
        body: body,
        retry: _retry()
      ),
      creator
  );

  FutureOr<FetchResponse<T>> upload<T extends ResponseMapper>(
      File file,
      String url,
      {
        Map<String, dynamic> queryParams = const {},
        Map<String, dynamic> body = const {},
        required T Function() creator
      }
  ) async => _processData(
      await _upload(
          file,
          url,
          queryParams: queryParams,
          retry: _retry()
      ),
      creator
  );
}

extension BaseApiClientLocalInterface on BaseApiClient{
  static const int _retryCount = 5;
  static const int _debugRetryCount = 1;

  int Function() _retry(){
    var retryCount = 0;

    return () => retryCount++;
  }

  Future<Response?> _fetch<T>(
      BaseFetcher fetcher,
      String url,
      {
        Map<String, dynamic> queryParams = const {},
        T? body,
        Map<String, String> headers = const {},
        int Function()? retry,
      }
  ) async {
      Response? response;
      try {
        response = await fetcher.fetch(
            _dioClient,
            url,
            queryParams,
            body,
            headers
        );
      } on UnauthorizedException{
        rethrow;
      } on ClientErrorException catch(e){
        _talker.debug(e.response?.data);
        response = e.response;
      } on ServerErrorException catch(e){
        response = e.response;

        if(retry == null){
          return response;
        }

        final retryNum = retry.call();
        if(retryNum < (kDebugMode ? _debugRetryCount : _retryCount)){
          _talker.debug('Retry after 2 seconds | #$retryNum');
          await Future.delayed(Duration(seconds: 2),);
          response = await _fetch(
              fetcher,
              url,
              queryParams: queryParams,
              body: body,
              retry: retry
          );
        }
      } on DioException catch(e){
        response = e.response;
      }
      catch(e){
        _talker.error('Request Error', e);
      }

      return response;
  }

  FetchResponse<T> _processData<T extends ResponseMapper>(Response? response, T Function() creator){
    final entity = creator.call();
    if(response == null || response.data == null || response.data is Map == false){
      return FetchResponse(
          statusCode: response?.statusCode ?? 0,
          data: null,
          headers: response?.headers.map ?? {}
      );
    }

    if(response.success){
      return FetchResponse<T>(
          statusCode: response.statusCode ?? 0,
          data: entity..fromJson(response.data),
          headers: response.headers.map
      );
    }

    return FetchResponse(
        statusCode: response.statusCode ?? 0,
        data: null,
        headers: response.headers.map,
        error: response.data
    );
  }

  Future<Response?> _upload<T extends ResponseMapper>(
      File file,
      String url,
      {
        Map<String, dynamic> queryParams = const {},
        Map<String, String> headers = const {},
        int Function()? retry,
      }
  ) async {
    final form = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.uri.pathSegments.last,
      ),
    });

    return await _fetch(
        UploadImageFetcher(),
        url,
        queryParams: queryParams,
        body: form,
        headers: headers,
        retry: retry
    );
  }
}