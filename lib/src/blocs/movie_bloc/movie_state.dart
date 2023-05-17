import 'package:bloc_test/src/models/item_model.dart';

abstract class MovieState {
  const MovieState();
}

class MovieInitialState extends MovieState {
  const MovieInitialState();
}

class MovieLoadingState extends MovieState {
  const MovieLoadingState();
}

class MovieErrorFetchDataState extends MovieState {
  final String errorMessage;
  const MovieErrorFetchDataState({
    required this.errorMessage,
  });
}

class MovieSuccessFetchDataState extends MovieState {
  final ItemModel movies;
  const MovieSuccessFetchDataState({
    required this.movies,
  });
}
