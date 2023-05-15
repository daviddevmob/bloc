import 'dart:async';
import 'package:bloc_test/src/models/trailer_model.dart';

import 'movie_api_provider/movie_api_provider.dart';
import '../models/item_model.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();
  Future<ItemModel?> fetchAllMovies() => moviesApiProvider.fetchMovieList();
  Future<TrailerModel> fetchTrailer(int movieId) =>
      moviesApiProvider.fetchTrailer(movieId);
}
