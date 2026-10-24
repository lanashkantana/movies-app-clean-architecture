part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowplayingMessage;

  final List<Movie> getPopularMovies;
  final RequestState popularState;
  final String popularMessage;

  final List<Movie> getTopRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MoviesState({
    // اول حالة بالتطبيق تكون فاضية
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowplayingMessage = '',

    this.getPopularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',

    this.getTopRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  @override
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingState,
    nowplayingMessage,
    getPopularMovies,
    popularState,
    popularMessage,
  getTopRatedMovies, // يجب أن تكون هنا
      topRatedState,     // يجب أن تكون هنا
      topRatedMessage,
  ];
  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowplayingMessage,

    List<Movie>? getPopularMovies,
    RequestState? popularState,
    String? popularMessage,

    List<Movie>? getTopRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowplayingMessage: nowplayingMessage ?? this.nowplayingMessage,

      getPopularMovies: getPopularMovies ?? this.getPopularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,

      getTopRatedMovies: getTopRatedMovies ?? this.getTopRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }
}
