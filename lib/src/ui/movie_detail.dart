import 'package:bloc_test/src/blocs/trailer_bloc/trailer_bloc.dart';
import 'package:bloc_test/src/blocs/trailer_bloc/trailer_event.dart';
import 'package:bloc_test/src/blocs/trailer_bloc/trailer_state.dart';
import 'package:bloc_test/src/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/trailer_model.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetail movieDetail;
  const MovieDetailScreen({super.key, required this.movieDetail});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                  "https://image.tmdb.org/t/p/w500${widget.movieDetail.posterPath}",
                  fit: BoxFit.cover,
                )),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(margin: EdgeInsets.only(top: 5.0)),
                Text(
                  widget.movieDetail.title,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 1.0, right: 1.0),
                    ),
                    Text(
                      widget.movieDetail.voteAverage.toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    ),
                    Text(
                      widget.movieDetail.releaseDate,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                Text(widget.movieDetail.overview),
                Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                Text(
                  "Trailer",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(margin: EdgeInsets.only(top: 8.0, bottom: 8.0)),
                BlocProvider(
                  create: (context) => TrailerBloc(widget.movieDetail.id),
                  child: BlocConsumer<TrailerBloc, TrailerState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Text("Ok");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget noTrailer(TrailerModel data) {
  return Center(
    child: Container(
      child: Text("No trailer available"),
    ),
  );
}

Widget trailerLayout(TrailerModel data) {
  if (data.results.length > 1) {
    return Row(
      children: <Widget>[
        trailerItem(data, 0),
        trailerItem(data, 1),
      ],
    );
  } else {
    return Row(
      children: <Widget>[
        trailerItem(data, 0),
      ],
    );
  }
}

trailerItem(TrailerModel data, int index) {
  return Expanded(
    child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5.0),
          height: 100.0,
          color: Colors.grey,
          child: Center(child: Icon(Icons.play_circle_filled)),
        ),
        Text(
          data.results[index].name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
