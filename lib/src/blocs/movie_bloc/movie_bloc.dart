import 'package:bloc_test/src/blocs/movie_bloc/movie_event.dart';
import 'package:bloc_test/src/blocs/movie_bloc/movie_state.dart';
import 'package:bloc_test/src/models/item_model.dart';
import 'package:bloc_test/src/resources/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(const MovieInitialState()) {
    on<GetAllMovies>(_onFetchDataEvent);
  }

  final repository = Repository();

  void _onFetchDataEvent(
    GetAllMovies event,
    Emitter<MovieState> emitter,
  ) async {
    emitter(MovieLoadingState());
    ItemModel? films = await repository.fetchAllMovies();
    if (films == null) {
      emitter(MovieErrorFetchDataState(errorMessage: "Error"));
    } else if (films.movies.isNotEmpty) {
      emitter(MovieSuccessFetchDataState(movies: films));
    } else {
      emitter(MovieErrorFetchDataState(errorMessage: "Lista Vazia"));
    }
  }
}
