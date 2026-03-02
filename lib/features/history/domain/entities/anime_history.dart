import 'package:flutter_core/flutter_core.dart';
import 'package:uuid/uuid.dart';

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

  factory AnimeHistory.from({
    required int anilist,
    required String name,
    required String image,
  }) => AnimeHistory(
      id: Uuid().v4(),
      anilist: anilist,
      name: name,
      image: image
  );

  @override
  List<Object?> get props => [
    anilist,
    image
  ];
}