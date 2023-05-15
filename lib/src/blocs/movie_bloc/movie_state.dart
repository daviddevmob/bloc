import 'package:bloc_test/src/models/item_model.dart';
import 'package:equatable/equatable.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieInitialState extends MovieState {
  const MovieInitialState();

  @override
  List<Object?> get props => [];
}

class MovieLoadingState extends MovieState {
  const MovieLoadingState();

  @override
  List<Object?> get props => [];
}

class MovieErrorFetchDataState extends MovieState {
  final String errorMessage;
  const MovieErrorFetchDataState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [];
}

class MovieSuccessFetchDataState extends MovieState {
  final ItemModel movies;
  const MovieSuccessFetchDataState({
    required this.movies,
  });

  @override
  List<Object?> get props => [];
}
