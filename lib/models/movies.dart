class Movies {
  String countryName;
  String title;
  String id;
  double voteCount;
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
        countryName: result["production_countries"][0]['name'],
        dateSortie: result['release_date'],
        genre: result['genres'][0]["name"],
        image: result['backdrop_path'],
        id: result['id'],
        title: result['original_title'],
        description: result['overview'],
        popularity: result['popularity'] ?? 0,
        voteCount: result["vote_count"],
      );
}
