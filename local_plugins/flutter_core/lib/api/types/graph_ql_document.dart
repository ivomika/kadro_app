import 'package:equatable/equatable.dart';

final class GraphQlDocument extends Equatable {
  final String source;
  final String? operationName;

  const GraphQlDocument({required this.source, this.operationName});

  @override
  List<Object?> get props => [source, operationName];
}
