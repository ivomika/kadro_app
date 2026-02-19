import 'dart:io';
import 'package:kadro_app/shared/domain/entities/anime_match.dart';

abstract interface class IAnimeMatchRepository{
  Future<List<AnimeMatch>> searchByImage(File file);
}