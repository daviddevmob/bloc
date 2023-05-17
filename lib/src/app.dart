import 'package:flutter/material.dart';
import 'ui/movie_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        
      },
      home: MovieList(),
    );
  }
}
