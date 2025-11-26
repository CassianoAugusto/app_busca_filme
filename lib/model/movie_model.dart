class MovieModel {
  final String title;
  final String year;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String plot;
  final String poster;

  MovieModel({
    required this.title,
    required this.year,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.plot,
    required this.poster,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['Title'] ?? '',
      year: json['Year'] ?? '',
      released: json['Released'] ?? '',
      runtime: json['Runtime'] ?? '',
      genre: json['Genre'] ?? '',
      director: json['Director'] ?? '',
      plot: json['Plot'] ?? '',
      poster: json['Poster'] ?? '',
    );
  }
}
