import 'package:flutter_core/api/types/api_types.dart';
import 'package:flutter_core/api/types/fetch_response.dart';
import 'package:flutter_core/api/types/graph_ql_error.dart';

final class GraphQlResponse<T> extends FetchResponse<T> {
  final List<GraphQlError> errors;
  final Map<String, dynamic> extensions;

  const GraphQlResponse({
    required super.statusCode,
    required super.data,
    required super.headers,
    super.error,
    this.errors = const [],
    this.extensions = const {},
  });

  factory GraphQlResponse.fromFetchResponse(
    FetchResponse<Map<String, dynamic>> response, {
    required JsonFactory<T> factory,
  }) {
    final payload = response.data;
    final errors = _readErrors(payload);

    return GraphQlResponse(
      statusCode: response.statusCode,
      data: _readData(payload, factory),
      headers: response.headers,
      error: errors.isEmpty
          ? response.error
          : {
              'errors': errors
                  .map((error) => error.toJson())
                  .toList(growable: false),
            },
      errors: errors,
      extensions: _readExtensions(payload),
    );
  }

  @override
  bool get isSuccess => super.isSuccess && errors.isEmpty;

  bool get hasErrors => errors.isNotEmpty;

  String? get primaryErrorMessage {
    if (errors.isEmpty) {
      return null;
    }

    return errors.first.message;
  }

  static T? _readData<T>(
    Map<String, dynamic>? payload,
    JsonFactory<T> factory,
  ) {
    final rawData = payload?['data'];
    if (rawData is! Map) {
      return null;
    }

    return factory(Map<String, dynamic>.from(rawData));
  }

  static List<GraphQlError> _readErrors(Map<String, dynamic>? payload) {
    final rawErrors = payload?['errors'];
    if (rawErrors is! List) {
      return const <GraphQlError>[];
    }

    return List<GraphQlError>.unmodifiable(
      rawErrors.whereType<Map>().map(
        (error) => GraphQlError.fromJson(Map<String, dynamic>.from(error)),
      ),
    );
  }

  static Map<String, dynamic> _readExtensions(Map<String, dynamic>? payload) {
    final rawExtensions = payload?['extensions'];
    if (rawExtensions is! Map) {
      return const <String, dynamic>{};
    }

    return Map<String, dynamic>.unmodifiable(
      rawExtensions.map((key, value) => MapEntry(key.toString(), value)),
    );
  }

  @override
  List<Object?> get props => [...super.props, errors, extensions];
}
