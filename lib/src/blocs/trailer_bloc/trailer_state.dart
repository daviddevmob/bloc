import 'package:bloc_test/src/models/item_model.dart';
import 'package:bloc_test/src/models/trailer_model.dart';
import 'package:equatable/equatable.dart';

abstract class TrailerState extends Equatable {
  const TrailerState();
}

class TrailerInitialState extends TrailerState {
  const TrailerInitialState();

  @override
  List<Object?> get props => [];
}

class TrailerLoadingState extends TrailerState {
  const TrailerLoadingState();

  @override
  List<Object?> get props => [];
}

class TrailerErrorFetchDataState extends TrailerState {
  final String errorMessage;
  const TrailerErrorFetchDataState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [];
}

class TrailerSuccessFetchDataState extends TrailerState {
  final TrailerModel trailer;
  const TrailerSuccessFetchDataState({
    required this.trailer,
  });

  @override
  List<Object?> get props => [];
}
