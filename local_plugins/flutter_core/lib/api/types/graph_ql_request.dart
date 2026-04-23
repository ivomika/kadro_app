import 'package:equatable/equatable.dart';

final class GraphQlRequest extends Equatable {
  final String query;
  final Map<String, dynamic> variables;
  final String? operationName;
  final Map<String, dynamic> extensions;

  const GraphQlRequest({
    required this.query,
    this.variables = const {},
    this.operationName,
    this.extensions = const {},
  });

  Map<String, dynamic> toJson() {
    final payload = <String, dynamic>{'query': query};

    if (operationName case final String operationName
        when operationName.trim().isNotEmpty) {
      payload['operationName'] = operationName.trim();
    }

    if (variables.isNotEmpty) {
      payload['variables'] = variables;
    }

    if (extensions.isNotEmpty) {
      payload['extensions'] = extensions;
    }

    return payload;
  }

  @override
  List<Object?> get props => [query, variables, operationName, extensions];
}
