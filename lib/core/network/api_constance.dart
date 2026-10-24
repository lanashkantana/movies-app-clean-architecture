class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String apiKey = "cfdbe20eb04a4153bf647565514f4c34";
  static const String nowPlayingMoviesPath =
      "movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath = "movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath = "movie/top_rated?api_key=$apiKey";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => "$baseImageUrl$path";

  static const String movieDetailsPath = "movie/{movie_id}?api_key=$apiKey";
  static const String movieRecommendationPath =
      "movie/{movie_id}/recommendations?api_key=$apiKey";
}
