import 'package:equatable/equatable.dart';

abstract interface class GraphQlVariables {
  Map<String, dynamic> toJson();
}

final class GraphQlNoVariables extends Equatable implements GraphQlVariables {
  const GraphQlNoVariables();

  @override
  Map<String, dynamic> toJson() => const {};

  @override
  List<Object?> get props => const [];
}
