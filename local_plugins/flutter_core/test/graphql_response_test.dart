import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GraphQlResponse', () {
    test('maps nested data payload into typed data', () {
      final response = GraphQlResponse.fromFetchResponse(
        const FetchResponse(
          statusCode: 200,
          data: {
            'data': {'title': 'Cowboy Bebop'},
          },
          headers: {},
        ),
        factory: TestGraphQlData.fromJson,
      );

      expect(response.isSuccess, isTrue);
      expect(response.data, const TestGraphQlData(title: 'Cowboy Bebop'));
      expect(response.errors, isEmpty);
    });

    test('treats GraphQL payload errors as unsuccessful response', () {
      final response = GraphQlResponse.fromFetchResponse(
        const FetchResponse(
          statusCode: 200,
          data: {
            'errors': [
              {
                'message': 'Media not found',
                'path': ['Media'],
              },
            ],
          },
          headers: {},
        ),
        factory: TestGraphQlData.fromJson,
      );

      expect(response.isSuccess, isFalse);
      expect(response.hasErrors, isTrue);
      expect(response.primaryErrorMessage, 'Media not found');
      expect(response.error, {
        'errors': [
          {
            'message': 'Media not found',
            'path': ['Media'],
          },
        ],
      });
    });
  });
}

final class TestGraphQlData extends Equatable {
  final String title;

  const TestGraphQlData({required this.title});

  factory TestGraphQlData.fromJson(Map<String, dynamic> json) {
    return TestGraphQlData(title: json['title'] as String? ?? '');
  }

  @override
  List<Object?> get props => [title];
}
