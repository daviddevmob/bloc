import 'package:bloc_test/src/blocs/movie_bloc/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/app.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => MovieBloc(),
    child: MyApp(),
  ));
}
