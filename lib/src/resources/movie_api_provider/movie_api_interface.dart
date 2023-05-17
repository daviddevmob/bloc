import 'package:bloc_test/src/models/item_model.dart';
import 'package:bloc_test/src/models/trailer_model.dart';

abstract class MovieApiInterface {
  Future<ItemModel?> fetchMovieList();
  Future<TrailerModel?> fetchTrailer(int movieId);
}
