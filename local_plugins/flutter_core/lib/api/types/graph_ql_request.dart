import 'package:equatable/equatable.dart';
import 'package:flutter_core/api/types/graph_ql_document.dart';

final class GraphQlRequest extends Equatable {
  final GraphQlDocument document;
  final Map<String, dynamic> variables;
  final Map<String, dynamic> extensions;

  const GraphQlRequest({
    required this.document,
    this.variables = const {},
    this.extensions = const {},
  });

  Map<String, dynamic> toJson() {
    final payload = <String, dynamic>{'query': document.source};

    if (document.operationName case final String operationName
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
  List<Object?> get props => [document, variables, extensions];
}
