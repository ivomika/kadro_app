import 'package:flutter_core/api/client/base_api_client.dart';
import 'package:flutter_core/api/exception/unauthorized_exception.dart';
import 'package:flutter_core/api/methods/request_method.dart';
import 'package:flutter_core/api/types/response_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talker/talker.dart';

class _EmptyData extends ResponseMapper{
  @override
  void fromJson(Map<String, dynamic> json) {}
}

void main() {
  const String baseUrl = 'https://api.trace.moe';
  final client = BaseApiClient(baseUrl);

  test('Search test', () async {
    final talker = Talker();
    try {
      await client.fetch(
          RequestMethod.get,
          'https://app.starbucks.tstr-dev-app.ru/api/v1/menu-board',
          creator: () => _EmptyData()
      );
    } on UnauthorizedException catch (e){
      talker.debug(e.response?.data);
    }
  });
}
