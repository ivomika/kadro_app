import 'package:flutter_core/flutter_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GraphQlOperation', () {
    test('converts typed operation into request payload', () {
      const operation = TestItemByIdQuery(
        variables: TestItemByIdVariables(id: 7),
      );

      final request = operation.toRequest();

      expect(request.document, operation.document);
      expect(request.document.operationName, 'ItemById');
      expect(request.document.source, contains('query ItemById'));
      expect(request.document.source, contains(r'item(id: $id)'));
      expect(request.variables, {'id': 7});
      expect(request.toJson(), {
        'query': operation.document.source,
        'operationName': 'ItemById',
        'variables': {'id': 7},
      });
    });
  });
}

final class TestItemByIdVariables extends Equatable
    implements GraphQlVariables {
  final int id;

  const TestItemByIdVariables({required this.id});

  @override
  Map<String, dynamic> toJson() => {'id': id};

  @override
  List<Object?> get props => [id];
}

final class TestItemByIdQuery
    extends GraphQlQueryOperation<TestGraphQlData, TestItemByIdVariables> {
  static const GraphQlDocument _document = GraphQlDocument(
    operationName: 'ItemById',
    source: '''
      query ItemById(\$id: Int!) {
        item(id: \$id) {
          title
        }
      }
    ''',
  );

  @override
  final TestItemByIdVariables variables;

  const TestItemByIdQuery({required this.variables});

  @override
  GraphQlDocument get document => _document;

  @override
  JsonFactory<TestGraphQlData> get factory => TestGraphQlData.fromJson;
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
