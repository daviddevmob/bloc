import 'dart:async';
import 'package:bloc_test/src/models/trailer_model.dart';
import 'package:dio/dio.dart';

import 'movie_api_provider/movie_api_provider.dart';
import '../models/item_model.dart';

class Repository {
  late Dio dio;
  late MovieApiProvider moviesApiProvider;
  Repository() {
    dio = Dio();
    moviesApiProvider = MovieApiProvider(dio);
  }
  Future<ItemModel?> fetchAllMovies() => moviesApiProvider.fetchMovieList();
  Future<TrailerModel?> fetchTrailer(int movieId) =>
      moviesApiProvider.fetchTrailer(movieId);
}
