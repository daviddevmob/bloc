import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class FetchDataEvent extends MovieEvent {
  @override
  List<Object?> get props => [];
}
