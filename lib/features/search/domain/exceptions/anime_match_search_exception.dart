final class AnimeMatchSearchException implements Exception {
  final String message;

  const AnimeMatchSearchException(this.message);

  @override
  String toString() => message;
}
