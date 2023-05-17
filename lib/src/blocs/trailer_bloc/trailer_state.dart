import 'package:youtube_player_iframe/youtube_player_iframe.dart';

abstract class TrailerState {
  const TrailerState();
}

class TrailerInitialState extends TrailerState {
  const TrailerInitialState();
}

class TrailerLoadingState extends TrailerState {
  const TrailerLoadingState();
}

class TrailerErrorFetchDataState extends TrailerState {
  final String errorMessage;
  const TrailerErrorFetchDataState({
    required this.errorMessage,
  });
}

class TrailerSuccessFetchDataState extends TrailerState {
  final YoutubePlayerController youtubeController;
  const TrailerSuccessFetchDataState({
    required this.youtubeController,
  });
}
