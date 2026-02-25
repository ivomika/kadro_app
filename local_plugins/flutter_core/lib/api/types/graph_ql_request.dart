final class GraphQlRequest {
  final String query;
  final Map<String, dynamic> variables;

  GraphQlRequest({
    required this.query,
    required this.variables
  });

  Map<String, dynamic> toJson(){
    return {
      'query': query,
      'variables': variables
    };
  }
}