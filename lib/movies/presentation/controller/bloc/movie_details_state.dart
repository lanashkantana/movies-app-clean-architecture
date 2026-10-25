// part of 'movie_details_bloc.dart';

// class MovieDetailsState extends Equatable {
//   const MovieDetailsState({
//     this.movieDetail,
//     this.movieDetailState = RequestState.loading,
//     this.movieDetailMessage = '',


//     this.recommendation=const[],
//     this.recommendationMesaage='',
//     this.recommendationState=RequestState.loading
//   });

//   final MovieDetail? movieDetail;
//   final RequestState movieDetailState;
//   final String movieDetailMessage;


//     final List<Recommendation> recommendation;
//   final RequestState recommendationState;
//   final String recommendationMesaage;


//   @override
//   List<Object?> get props => [movieDetail, movieDetailState, movieDetailMessage,recommendation,recommendationMesaage,recommendationState];
//   MovieDetailsState copyWith({
//     MovieDetail? movieDetail,
//     RequestState? movieDetailState,
//     String? movieDetailMessage,

//     List<Recommendation>? recommendation,
//     RequestState? recommendationState,
//     String? recommendationMesaage





//   }) {
//     return MovieDetailsState(
//       movieDetail: movieDetail ?? this.movieDetail,
//       movieDetailState: movieDetailState ?? this.movieDetailState,
//       movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
//       recommendationState:recommendationState??this.recommendationState,
//       recommendationMesaage:recommendationMesaage??this.recommendationMesaage,
//       recommendation: recommendation??this.recommendation

//     );
//   }
// }
