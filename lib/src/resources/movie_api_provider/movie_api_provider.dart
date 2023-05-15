import 'dart:async';
import 'package:bloc_test/src/models/trailer_model.dart';
import 'package:bloc_test/src/resources/movie_api_provider/movie_api_interface.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../../models/item_model.dart';

class MovieApiProvider implements MovieApiInterface {
  Client client = Client();
  final apiKey = '910c6fae385cff4def085a6f79613a3b';
  final baseUrl = "http://api.themoviedb.org/3/movie/";

  Future<ItemModel?> fetchMovieList() async {
    final response =
        await client.get(Uri.parse("$baseUrl/popular?api_key=$apiKey"));
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      return null;
      /*  throw Exception('Failed to load post'); */
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async {
    final response =
        await client.get(Uri.parse("$baseUrl/$movieId/videos?api_key=$apiKey"));

    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}
