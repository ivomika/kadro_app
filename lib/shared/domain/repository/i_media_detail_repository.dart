import 'package:kadro_app/shared/domain/entities/media_detail.dart';

abstract interface class IMediaDetailRepository {
  Future<MediaDetail?> searchByAnilistId(int id, double similarity);
}
