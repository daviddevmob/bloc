class ItemModel {
  int page;
  int totalResults;
  int totalPages;
  List<MovieDetail> movies = [];

  ItemModel({
    required this.page,
    required this.totalPages,
    required this.movies,
    required this.totalResults,
  });

  factory ItemModel.fromJson(Map json) {
    return ItemModel(
      page: json['page'],
      totalPages: json['total_pages'],
      movies: (json['results'] as List)
          .map((e) => MovieDetail.fromJson(e))
          .toList(),
      totalResults: json['total_results'],
    );
  }
}

class MovieDetail {
  int voteCount;
  int id;
  bool video;
  var voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds = [];
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  MovieDetail({
    required this.voteCount,
    required this.id,
    required this.video,
    required this.voteAverage,
    required this.title,
    required this.popularity,
    required this.posterPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.genreIds,
    required this.backdropPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
  });

  factory MovieDetail.fromJson(Map json) {
    return MovieDetail(
      voteCount: json['vote_count'],
      id: json['id'],
      video: json['video'],
      voteAverage: json['vote_average'],
      title: json['title'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      genreIds: (json['genre_ids'] as List).map((e) => (e as int)).toList(),
      backdropPath: json['backdrop_path'],
      adult: json['adult'],
      overview: json['overview'],
      releaseDate: json['release_date'],
    );
  }
}
