part of 'movie_details_cubit.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailState = RequestState.loading,
    this.movieDetailMessage = '',
    this.recommendation = const [],
    this.recommendationMessage = '', // تم تصحيح الإملاء
    this.recommendationState = RequestState.loading,
  });

  final MovieDetail? movieDetail;
  final RequestState movieDetailState;
  final String movieDetailMessage;

  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailState,
        movieDetailMessage,
        recommendation,
        recommendationMessage,
        recommendationState,
      ];

  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailState,
    String? movieDetailMessage,
    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailState: movieDetailState ?? this.movieDetailState,
      movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage: recommendationMessage ?? this.recommendationMessage,
      recommendation: recommendation ?? this.recommendation,
    );
  }
}