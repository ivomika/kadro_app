import 'package:flutter_core/flutter_core.dart';

class AnimeHistory extends Equatable{
  final String id;
  final int anilist;
  final String name;
  final String image;


  const AnimeHistory({
    required this.id,
    required this.anilist,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [
    anilist,
    image
  ];
}