import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/movies/domain/usecases/get_nowplaying_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies_app/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/now_playing_bloc/now_playing_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/popular_bloc/popular_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/top_rated_bloc/top_rated_bloc.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';

class MoviesApp extends StatelessWidget {
  final NowPlayingMoviesService nowPlayingMoviesService;
  final PopularMoviesService popularMoviesService;
  final TopRatedMoviesService topRatedMoviesService;
  final MovieDetailsService movieDetailsService;

  const MoviesApp({
    super.key,
    required this.nowPlayingMoviesService,
    required this.popularMoviesService,
    required this.topRatedMoviesService,
    required this.movieDetailsService,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NowPlayingBloc(nowPlayingMoviesService),
        ),
        BlocProvider(
          create: (context) => PopularBloc(popularMoviesService),
        ),
        BlocProvider(
          create: (context) => TopRatedBloc(topRatedMoviesService),
        ),
        BlocProvider(
          create: (context) => MovieDetailsBloc(movieDetailsService),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainMoviesScreen(),
    );
  }
}
