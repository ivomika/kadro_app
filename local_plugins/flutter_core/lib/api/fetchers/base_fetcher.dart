import 'dart:async';
import 'package:dio/dio.dart';

abstract class BaseFetcher<T> {
   Map<String, String> get headers;
   const BaseFetcher();
   Future<Response<Map<String, dynamic>>> fetch(
       Dio dioClient,
       String url, [
         Map<String, dynamic> queryParams = const {},
         T body,
         Map<String, String> headers = const {},
       ]);
}