import 'dart:math';

import 'package:bloc_test/src/models/item_model.dart';
import 'package:bloc_test/src/models/trailer_model.dart';
import 'package:bloc_test/src/resources/movie_api_provider/movie_api_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_api_provider_test.mocks.dart';

class MovieApiProviderTest extends Mock implements MovieApiInterface {}

@GenerateMocks([MovieApiProviderTest])
void main() async {
  late MockMovieApiProviderTest mockMovieApiProviderTest;
  setUp(() {
    mockMovieApiProviderTest = MockMovieApiProviderTest();
  });

  group('Movie Api Provider', () {
    test('Test - Fetch all popular movies', () async {
      ItemModel movie = ItemModel(
        page: 0,
        totalPages: 2,
        movies: [],
        totalResults: 1,
      );
      when(mockMovieApiProviderTest.fetchMovieList())
          .thenAnswer((result) async => movie);

      final res = await mockMovieApiProviderTest.fetchMovieList();
      expect(res, isA<ItemModel>());
      expect(res, movie);
    });
    test('Test - Fetch all popular movies throws exception', () {
      when(mockMovieApiProviderTest.fetchMovieList())
          .thenAnswer((result) async {
        throw Exception();
      });

      final res = mockMovieApiProviderTest.fetchMovieList();
      expect(res, throwsException);
    });
    test('Test - Fetch trailer', () async {
      final TrailerModel trailerModel = TrailerModel(id: 1, results: []);
      when(mockMovieApiProviderTest.fetchTrailer(5))
          .thenAnswer((realInvocation) async => trailerModel);
      final res = await mockMovieApiProviderTest.fetchTrailer(5);
      expect(res, isA<TrailerModel>());
      expect(res, trailerModel);
    });
    test("Test - Fetch trailer throw exception", () {
      when(mockMovieApiProviderTest.fetchTrailer(5))
          .thenAnswer((realInvocation) async => throw Exception());
      final res = mockMovieApiProviderTest.fetchTrailer(5);
      expect(res, throwsException);
    });
  });
}
