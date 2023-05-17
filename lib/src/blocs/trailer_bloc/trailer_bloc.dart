/* import 'package:flutter/material.dart';
import 'movie_detail_bloc.dart';
export 'movie_detail_bloc.dart';

class MovieDetailBlocProvider extends InheritedWidget {
  late final MovieDetailBloc bloc;

  MovieDetailBlocProvider({Key? key, required Widget child})
      : bloc = MovieDetailBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static MovieDetailBloc of(BuildContext context) {
    return (context
                .dependOnInheritedWidgetOfExactType<MovieDetailBlocProvider>()
            as MovieDetailBlocProvider)
        .bloc;
  }
}
 */

import 'package:bloc_test/src/blocs/trailer_bloc/trailer_event.dart';
import 'package:bloc_test/src/blocs/trailer_bloc/trailer_state.dart';
import 'package:bloc_test/src/models/trailer_model.dart';
import 'package:bloc_test/src/resources/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TrailerBloc extends Bloc<TrailerEvent, TrailerState> {
  final int movieId;
  TrailerBloc(this.movieId) : super(const TrailerInitialState()) {
    on<FetchTrailer>(getTrailers);
  }
  final repository = Repository();
  final trailerYoutubeController = YoutubePlayerController(
    params: YoutubePlayerParams(
      mute: false,
      showControls: true,
      showFullscreenButton: true,
    ),
  );
  bool loadVideo = false;

  getTrailers(
    FetchTrailer event,
    Emitter<TrailerState> emitter,
  ) async {
    emitter(TrailerLoadingState());
    TrailerModel? trailer = await repository.fetchTrailer(movieId);
    if (trailer == null) {
      emitter(TrailerErrorFetchDataState(errorMessage: "Error"));
    } else {
      final controller = YoutubePlayerController.fromVideoId(
        videoId: trailer.results.first.key,
        autoPlay: false,
        params: const YoutubePlayerParams(showFullscreenButton: true),
      );
      emitter(
        TrailerSuccessFetchDataState(
          youtubeController: controller,
        ),
      );
    }
  }
}
