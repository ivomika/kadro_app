import 'package:flutter_core/api/fetchers/base_fetcher.dart';
import 'package:flutter_core/api/fetchers/delete_fetcher.dart';
import 'package:flutter_core/api/fetchers/get_fetcher.dart';
import 'package:flutter_core/api/fetchers/post_fetcher.dart';
import 'package:flutter_core/api/fetchers/put_fetcher.dart';

enum RequestMethod {
  get('GET', GetFetcher()),
  post('POST', PostFetcher()),
  put('PUT', PutFetcher()),
  delete('DELETE', DeleteFetcher());

  const RequestMethod(this.name, this.fetcher);

  final String name;
  final BaseFetcher fetcher;
}