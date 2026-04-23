String? extractErrorMessage(Object? payload) {
  if (payload is String) {
    final message = payload.trim();
    return message.isEmpty ? null : message;
  }

  if (payload is! Map) {
    return null;
  }

  final dynamic error = payload['error'];
  if (error is String) {
    final message = error.trim();
    if (message.isNotEmpty) {
      return message;
    }
  }

  final dynamic message = payload['message'];
  if (message is String) {
    final trimmedMessage = message.trim();
    if (trimmedMessage.isNotEmpty) {
      return trimmedMessage;
    }
  }

  final dynamic errors = payload['errors'];
  if (errors is! List) {
    return null;
  }

  for (final errorEntry in errors) {
    if (errorEntry is! Map) {
      continue;
    }

    final dynamic graphQlMessage = errorEntry['message'];
    if (graphQlMessage is! String) {
      continue;
    }

    final trimmedMessage = graphQlMessage.trim();
    if (trimmedMessage.isNotEmpty) {
      return trimmedMessage;
    }
  }

  return null;
}
