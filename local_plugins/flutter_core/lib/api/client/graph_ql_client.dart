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

  FutureOr<GraphQlResponse<TData>>
  executeOperation<TData, TVariables extends GraphQlVariables>(
    GraphQlOperation<TData, TVariables> operation, {
    String path = '',
    RequestMethod method = RequestMethod.post,
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headers = const {},
  });

  FutureOr<GraphQlResponse<T>> query<T>(
    GraphQlRequest request, {
    String path = '',
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headers = const {},
    required JsonFactory<T> factory,
  });

  FutureOr<GraphQlResponse<TData>>
  queryOperation<TData, TVariables extends GraphQlVariables>(
    GraphQlQueryOperation<TData, TVariables> operation, {
    String path = '',
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headers = const {},
  });

  FutureOr<GraphQlResponse<T>> mutate<T>(
    GraphQlRequest request, {
    String path = '',
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headers = const {},
    required JsonFactory<T> factory,
  });

  FutureOr<GraphQlResponse<TData>>
  mutateOperation<TData, TVariables extends GraphQlVariables>(
    GraphQlMutationOperation<TData, TVariables> operation, {
    String path = '',
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headers = const {},
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
  Future<GraphQlResponse<TData>>
  executeOperation<TData, TVariables extends GraphQlVariables>(
    GraphQlOperation<TData, TVariables> operation, {
    String path = '',
    RequestMethod method = RequestMethod.post,
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headers = const {},
  }) {
    return executeGraphQl(
      operation.toRequest(),
      path: path,
      method: method,
      queryParams: queryParams,
      headers: headers,
      factory: operation.factory,
    );
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
  Future<GraphQlResponse<TData>>
  queryOperation<TData, TVariables extends GraphQlVariables>(
    GraphQlQueryOperation<TData, TVariables> operation, {
    String path = '',
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headers = const {},
  }) {
    return executeOperation(
      operation,
      path: path,
      method: RequestMethod.post,
      queryParams: queryParams,
      headers: headers,
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

  @override
  Future<GraphQlResponse<TData>>
  mutateOperation<TData, TVariables extends GraphQlVariables>(
    GraphQlMutationOperation<TData, TVariables> operation, {
    String path = '',
    Map<String, dynamic> queryParams = const {},
    Map<String, String> headers = const {},
  }) {
    return executeOperation(
      operation,
      path: path,
      method: RequestMethod.post,
      queryParams: queryParams,
      headers: headers,
    );
  }
}
