import 'package:bloc_test/src/models/item_model.dart';
import 'package:bloc_test/src/resources/movie_api_provider/movie_api_provider.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

@GenerateMocks([Dio])
void main() {
  Dio mockDio = Dio();
  late MovieApiProvider movieApiProvider;
  setUp(() => movieApiProvider = MovieApiProvider(mockDio));
  test('Return to popular movies list', () async {
    when(mockDio.get(
            "${movieApiProvider.baseUrl}/popular?api_key=${movieApiProvider.apiKey}"))
        .thenAnswer(
      (inv) => Future.value(
        Response(
          statusCode: 200,
          requestOptions: RequestOptions(
              path:
                  "${movieApiProvider.baseUrl}/popular?api_key=${movieApiProvider.apiKey}"),
        ),
      ),
    );
    expect(
      await movieApiProvider.fetchMovieList(),
      ItemModel,
    );
  });
}
