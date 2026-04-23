import 'package:equatable/equatable.dart';

class FetchResponse<T> extends Equatable {
  final int statusCode;
  final T? data;
  final Object? error;
  final Map<String, List<String>> headers;
  bool get isSuccess => statusCode >= 200 && statusCode < 300;

  const FetchResponse({
    required this.statusCode,
    required this.data,
    required this.headers,
    this.error,
  });

  @override
  List<Object?> get props => [statusCode, data, error, headers];
}
