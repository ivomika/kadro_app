import 'package:equatable/equatable.dart';

final class GraphQlErrorLocation extends Equatable {
  final int line;
  final int column;

  const GraphQlErrorLocation({required this.line, required this.column});

  factory GraphQlErrorLocation.fromJson(Map<String, dynamic> json) {
    return GraphQlErrorLocation(
      line: json['line'] as int? ?? 0,
      column: json['column'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'line': line, 'column': column};
  }

  @override
  List<Object?> get props => [line, column];
}

final class GraphQlError extends Equatable {
  final String message;
  final List<GraphQlErrorLocation> locations;
  final List<Object?> path;
  final Map<String, dynamic> extensions;

  const GraphQlError({
    required this.message,
    this.locations = const [],
    this.path = const [],
    this.extensions = const {},
  });

  factory GraphQlError.fromJson(Map<String, dynamic> json) {
    final rawLocations = json['locations'];
    final rawPath = json['path'];
    final rawExtensions = json['extensions'];

    return GraphQlError(
      message: json['message'] as String? ?? 'Unknown GraphQL error',
      locations: rawLocations is List
          ? List<GraphQlErrorLocation>.unmodifiable(
              rawLocations.whereType<Map>().map(
                (location) => GraphQlErrorLocation.fromJson(
                  Map<String, dynamic>.from(location),
                ),
              ),
            )
          : const <GraphQlErrorLocation>[],
      path: rawPath is List
          ? List<Object?>.unmodifiable(rawPath)
          : const <Object?>[],
      extensions: rawExtensions is Map
          ? Map<String, dynamic>.unmodifiable(
              rawExtensions.map(
                (key, value) => MapEntry(key.toString(), value),
              ),
            )
          : const <String, dynamic>{},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      if (locations.isNotEmpty)
        'locations': locations
            .map((location) => location.toJson())
            .toList(growable: false),
      if (path.isNotEmpty) 'path': path.toList(growable: false),
      if (extensions.isNotEmpty) 'extensions': extensions,
    };
  }

  @override
  List<Object?> get props => [message, locations, path, extensions];
}
