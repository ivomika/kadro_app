import 'package:equatable/equatable.dart';
import 'package:flutter_core/api/types/api_types.dart';
import 'package:flutter_core/api/types/graph_ql_document.dart';
import 'package:flutter_core/api/types/graph_ql_request.dart';
import 'package:flutter_core/api/types/graph_ql_variables.dart';

abstract class GraphQlOperation<TData, TVariables extends GraphQlVariables>
    extends Equatable {
  const GraphQlOperation();

  GraphQlDocument get document;
  TVariables get variables;
  JsonFactory<TData> get factory;
  Map<String, dynamic> get extensions => const {};

  GraphQlRequest toRequest() {
    return GraphQlRequest(
      document: document,
      variables: variables.toJson(),
      extensions: extensions,
    );
  }

  @override
  List<Object?> get props => [document, variables, extensions];
}

abstract class GraphQlQueryOperation<TData, TVariables extends GraphQlVariables>
    extends GraphQlOperation<TData, TVariables> {
  const GraphQlQueryOperation();
}

abstract class GraphQlMutationOperation<
  TData,
  TVariables extends GraphQlVariables
>
    extends GraphQlOperation<TData, TVariables> {
  const GraphQlMutationOperation();
}
