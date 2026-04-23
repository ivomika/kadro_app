import 'dart:async';

import 'package:flutter_core/api/client/base_api_client.dart';
import 'package:flutter_core/api/types/types.dart';

abstract interface class GraphQlClient {
  FutureOr<GraphQlResponse<T>> executeGraphQl<T>(
    GraphQlRequest request, {
    String path = '',
    RequestMethod method = RequestMethod.post,
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headers = const {},
    required JsonFactory<T> factory,
  });

  FutureOr<GraphQlResponse<T>> query<T>(
    GraphQlRequest request, {
    String path = '',
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headers = const {},
    required JsonFactory<T> factory,
  });

  FutureOr<GraphQlResponse<T>> mutate<T>(
    GraphQlRequest request, {
    String path = '',
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headers = const {},
    required JsonFactory<T> factory,
  });
}

mixin GraphQlClientMixin on BaseApiClient implements GraphQlClient {
  @override
  Future<GraphQlResponse<T>> executeGraphQl<T>(
    GraphQlRequest request, {
    String path = '',
    RequestMethod method = RequestMethod.post,
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headers = const {},
    required JsonFactory<T> factory,
  }) async {
    final rawResponse = await fetch<Map<String, dynamic>>(
      method,
      path,
      queryParams: queryParams,
      body: request.toJson(),
      headers: headers,
      factory: (json) => json,
    );

    return GraphQlResponse.fromFetchResponse(rawResponse, factory: factory);
  }

  @override
  Future<GraphQlResponse<T>> query<T>(
    GraphQlRequest request, {
    String path = '',
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headers = const {},
    required JsonFactory<T> factory,
  }) {
    return executeGraphQl(
      request,
      path: path,
      method: RequestMethod.post,
      queryParams: queryParams,
      headers: headers,
      factory: factory,
    );
  }

  @override
  Future<GraphQlResponse<T>> mutate<T>(
    GraphQlRequest request, {
    String path = '',
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headers = const {},
    required JsonFactory<T> factory,
  }) {
    return executeGraphQl(
      request,
      path: path,
      method: RequestMethod.post,
      queryParams: queryParams,
      headers: headers,
      factory: factory,
    );
  }
}
