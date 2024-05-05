class ApiConstants {
  static const String apikey = '2ee990250899858808ca582fd12bc9fc';
  static const String baseurl = 'https://api.themoviedb.org/3';
  static const String nowPlayingMoviesUrl =
      '$baseurl/movie/now_playing?api_key=$apikey';
  static const String popularMoviesUrl =
      '$baseurl/movie/popular?api_key=$apikey';
  static const String topRatedMoviesUrl =
      '$baseurl/movie/top_rated?api_key=$apikey';
  static const String baseImgUrl = 'https://image.tmdb.org/t/p/w500';

  static String getImgUrl(String imgPath) => '$baseImgUrl$imgPath';
  static String getMovieDetailsUrl(int id) =>
      '$baseurl/movie/$id?api_key=$apikey';
}
