import 'dart:io';
import 'package:kadro_app/flows/search/domain/entities/anime_match.dart';

abstract interface class IAnimeMatchRepository{
  Future<List<AnimeMatch>> searchByImage(File file);
  Future<List<AnimeMatch>> searchByUrl(String url);
}