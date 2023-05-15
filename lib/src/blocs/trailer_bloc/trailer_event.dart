import 'package:equatable/equatable.dart';

abstract class TrailerEvent extends Equatable {
  const TrailerEvent();
}

class FetchTrailer extends TrailerEvent {
  @override
  List<Object?> get props => [];
}
