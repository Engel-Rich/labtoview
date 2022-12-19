import 'package:test/variables/globalconst.dart';

class Movies {
  String countryName;
  String title;
  int id;
  int voteCount;
  String dateSortie;
  String genre;
  String? description;
  String image;
  double popularity;

  Movies({
    required this.countryName,
    required this.dateSortie,
    required this.genre,
    required this.image,
    required this.id,
    this.description,
    required this.title,
    required this.voteCount,
    required this.popularity,
  });

  factory Movies.fromApi(result) => Movies(
        countryName: result["production_countries"][0]['name'] !=
                "United States of America"
            ? result["production_countries"][0]['name']
            : "USA",
        dateSortie: result['release_date'],
        genre: result['genres'][0]["name"],
        image: result['backdrop_path'] ??
            imageUrl('/1tlXFhE6qnap6xvd4d4vzfHZpDZ.jpg'),
        id: result['id'],
        title: result['original_title'],
        description: result['overview'],
        popularity: result['popularity'] ?? 0,
        voteCount: result["vote_count"],
      );

  toMap() => {
        "countryName": countryName,
        'dateSortie': dateSortie,
        "genre": genre,
        'image': image,
        "titre": title,
        'id': id,
        'description': description,
        'popularity': popularity,
        'voteCount': voteCount,
      };
}
