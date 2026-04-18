final class MediaDetailException implements Exception {
  final String message;

  const MediaDetailException(this.message);

  @override
  String toString() => message;
}
