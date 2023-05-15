import 'package:bloc_test/src/blocs/movie_bloc/movie_bloc.dart';
import 'package:bloc_test/src/blocs/movie_bloc/movie_event.dart';
import 'package:bloc_test/src/blocs/movie_bloc/movie_state.dart';
import 'package:bloc_test/src/ui/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/item_model.dart';

class MovieList extends StatefulWidget {
  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late MovieBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = context.read<MovieBloc>();
    bloc.add(FetchDataEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: BlocConsumer<MovieBloc, MovieState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MovieLoadingState || state is MovieInitialState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is MovieErrorFetchDataState) {
            return Center(child: Text(state.errorMessage));
          }
          if (state is MovieSuccessFetchDataState) {
            return buildList(state.movies);
          }
          return Center(
            child: TextButton(
              onPressed: () {
                bloc.add(FetchDataEvent());
              },
              child: Text("Refresh"),
            ),
          );
        },
      ),
    );
    /*   body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ), */
  }

  Widget buildList(ItemModel result) {
    return GridView.builder(
      itemCount: result.movies.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          child: InkResponse(
            child: Image.network(
              'https://image.tmdb.org/t/p/w185${result.movies[index].posterPath}',
              fit: BoxFit.cover,
            ),
            onTap: () => openDetailPage(result, index),
          ),
        );
      },
    );
  }

  openDetailPage(ItemModel data, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return MovieDetailScreen(
          movieDetail: data.movies[index],
        );
      }),
    );
  }
}
