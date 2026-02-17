import 'package:flutter_core/api/fetchers/fetchers.dart';

enum RequestMethod {
  get('GET', GetFetcher()),
  post('POST', PostFetcher()),
  put('PUT', PutFetcher()),
  delete('DELETE', DeleteFetcher());

  const RequestMethod(this.name, this.fetcher);

  final String name;
  final BaseFetcher fetcher;
}