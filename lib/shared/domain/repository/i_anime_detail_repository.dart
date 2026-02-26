import 'package:kadro_app/shared/domain/entities/anime_detail.dart';

abstract interface class IAnimeDetailRepository{
  Future<AnimeDetail?> searchByAnilistId(int id, double similarity);
}