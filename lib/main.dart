import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/app.dart';
import 'package:movies_app/core/movies_observer.dart';
import 'package:movies_app/movies/data/datasource/movies_remote_datasource.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/movies/domain/usecases/get_nowplaying_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies.dart';

void main() {
  Bloc.observer = MoviesBlocObserver();
  BaseMoviesRepository bmrepo = MoviesRepository(MoviesRemoteDataSource(Dio()));
  
  runApp(
    MoviesApp(
      nowPlayingMoviesService: NowPlayingMoviesService(bmrepo),
      popularMoviesService: PopularMoviesService(bmrepo),
      topRatedMoviesService: TopRatedMoviesService(bmrepo),
      movieDetailsService: MovieDetailsService(bmrepo),
    ),
  );
}
