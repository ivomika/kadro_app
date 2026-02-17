typedef Fetcher = Future<void> Function();
typedef Mapper<Result, Data> = Result? Function(Data data);
typedef JsonFactory<T> = T Function(Map<String, dynamic> json);