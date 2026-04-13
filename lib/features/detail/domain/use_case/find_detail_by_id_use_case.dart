import 'package:flutter_core/flutter_core.dart';
import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';
import 'package:kadro_app/features/detail/domain/repository/i_media_detail_repository.dart';

final class FindDetailRequest{
  final int id;
  final double similarity;

  FindDetailRequest(this.id, this.similarity);
}

class FindDetailByIdUseCase implements IUseCase<FindDetailRequest, Future<MediaDetail>> {
  final IMediaDetailRepository _repository;

  FindDetailByIdUseCase(this._repository);

  @override
  Future<MediaDetail> execute([FindDetailRequest? props]) async {
    if(props == null){
      throw NotNullableError<FindDetailRequest>('props');
    }

    final result = await _repository.searchByAnilistId(
      props.id,
      props.similarity,
    );

    if(result == null){
      throw Exception('did`t find anime detail');
    }

    return result;
  }
}