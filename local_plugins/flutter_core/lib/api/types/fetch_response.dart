import 'package:equatable/equatable.dart';
import 'package:flutter_core/api/types/response_mapper.dart';

class FetchResponse<T extends ResponseMapper> extends Equatable{
  final int statusCode;
  final T? data;
  final Map<String, dynamic>? error;
  final Map<String, List<String>> headers;
  bool get isSuccess => statusCode >= 200 && statusCode < 300;

  const FetchResponse({
    required this.statusCode,
    required this.data,
    required this.headers,
    this.error,
  });


  @override
  List<Object?> get props => [];
}