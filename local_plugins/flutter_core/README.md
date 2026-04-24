# flutter_core

`flutter_core` is a lightweight shared package with reusable networking,
repository, logging, and storage primitives for Flutter applications.

## HTTP clients

Use `BaseApiClient` when you need a typed `Dio` client with existing core
logging, retry, and error-routing behavior.

```dart
final class TraceMoeClient extends BaseApiClient {
  TraceMoeClient() : super('https://api.trace.moe');
}
```

`fetch()` and `upload()` return `FetchResponse<T>` and keep transport failures
in the existing `UnauthorizedException`, `ClientErrorException`, and
`ServerErrorException` flow.

## GraphQL clients

Use `GraphQlClientMixin` on top of `BaseApiClient` to keep GraphQL requests in
the same `Dio`/retry/interceptor pipeline.

```dart
final class ExampleGraphQlClient extends BaseApiClient with GraphQlClientMixin {
  ExampleGraphQlClient() : super('https://example.com/graphql');

  Future<GraphQlResponse<ExampleQueryData>> itemById(int id) {
    return queryOperation(
      ExampleItemByIdQuery(
        variables: ExampleItemByIdVariables(id: id),
      ),
    );
  }
}
```

Recommended layering:

- keep the GraphQL document inside a dedicated operation object
- keep request variables in a typed variables object
- let the client execute operations instead of assembling ad-hoc payload maps

`GraphQlResponse<T>` treats GraphQL payload errors as a failed response even
when the HTTP status is `200`, so repository code can continue using the
familiar `isSuccess` check.

A real project example is available in Kadro's `AnilistClient`, which uses the
same mixin and response abstractions against AniList.
