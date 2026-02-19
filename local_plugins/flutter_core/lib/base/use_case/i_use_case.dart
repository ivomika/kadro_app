abstract interface class IUseCase<Request, Result> {
  Result execute([Request? props]);
}