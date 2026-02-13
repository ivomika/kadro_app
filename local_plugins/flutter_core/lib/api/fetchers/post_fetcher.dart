import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_core/api/fetchers/base_fetcher.dart';

class PostFetcher extends BaseFetcher<Map<String, dynamic>> {
  static const Map<String, String> _headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  @override
  Map<String, String> get headers => _headers;

  const PostFetcher();

  @override
  Future<Response<Map<String, dynamic>>> fetch(
      Dio dioClient,
      String url, [
        Map<String, dynamic> queryParams = const {},
        Map<String, dynamic> body = const {},
        Map<String, String> headers = const {},
      ]) async {
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
