import 'package:kadro_app/features/detail/domain/entities/media_detail.dart';

abstract interface class IMediaDetailRepository {
  Future<MediaDetail?> searchByAnilistId(int id, double similarity);
}
