import 'package:flutter_test/flutter_test.dart';
import 'package:kadro_app/features/detail/data/datasource/anilist_client.dart';

void main() {
  group('AnilistClient', () {
    test(
      'loads media details through the shared GraphQL client',
      () async {
        final client = AnilistClient();

        final response = await client.searchByAnilistId(1);

        expect(response.isSuccess, isTrue);
        expect(response.errors, isEmpty);
        expect(response.data, isNotNull);
        expect(response.data!.media.id, greaterThan(0));
        expect(response.data!.media.title.romaji, isNotEmpty);
      },
      timeout: const Timeout(Duration(seconds: 20)),
    );
  });
}
