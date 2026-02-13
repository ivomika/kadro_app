import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_core/api/fetchers/base_fetcher.dart';

class UploadImageFetcher extends BaseFetcher<FormData> {
  static const Map<String, String> _headers = {
    "Content-Type": "multipart/form-data",
    "Accept": "application/json",
  };

  @override
  Map<String, String> get headers => _headers;

  const UploadImageFetcher();

  @override
  Future<Response<Map<String, dynamic>>> fetch(
      Dio dioClient,
      String url, [
        Map<String, dynamic> queryParams = const {},
        FormData? body,
        Map<String, String> headers = const {},
      ]) async {
    print(body?.files.first.value.headers);
    print(body?.files.first.value.contentType);
    print(body?.files.first.value.filename);
    print(body?.fields);
    dioClient.options.headers['Connection'] = 'close';
    dioClient.options
      ..connectTimeout = const Duration(seconds: 15)
      ..sendTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 30);
    return await dioClient.post<Map<String, dynamic>>(
        url,
        data: body,
        queryParameters: queryParams,
        options: Options(
            headers: {
              ...this.headers,
              ...headers
            }
        )
    );
  }
}
