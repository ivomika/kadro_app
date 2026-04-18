String? extractErrorMessage(Object? payload) {
  if (payload is! Map) {
    return null;
  }

  final dynamic error = payload['error'];
  if (error is! String) {
    return null;
  }

  final message = error.trim();
  if (message.isEmpty) {
    return null;
  }

  return message;
}
