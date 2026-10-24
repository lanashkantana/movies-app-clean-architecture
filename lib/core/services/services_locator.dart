import 'package:film_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:film_app/movies/data/repository/movies_repository.dart';
import 'package:film_app/movies/domain/repository/base_movies_repository.dart';
import 'package:film_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:film_app/movies/domain/usecases/get_movie_recommendation_usecase.dart';
import 'package:film_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:film_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:film_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:film_app/movies/presentation/controller/bloc/movie_details_bloc.dart';
import 'package:film_app/movies/presentation/controller/bloc/movies_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    ///! Bloc

    getIt.registerFactory(() => MoviesBloc(getIt(),getIt(),getIt()));


    getIt.registerFactory(() => MovieDetailsBloc(getIt(),getIt()));


    //! UseCases
    getIt.registerLazySingleton(() => GetNowPlayingMoviesUsecase(getIt()));


 //! use case for recommendations
     getIt.registerLazySingleton(() => GetMovieRecommendationUsecase(getIt()));

    //! use case for details
      getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt()));


    //?use case two 
    getIt.registerLazySingleton(() => GetPopularMoviesUsecase(getIt()));

     //?use case three
      getIt.registerLazySingleton(() => GetTopRatedMoviesUsecase(getIt()));

    //! Repositry
    getIt.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(getIt()),
    );



    //! Data Source

    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );
  }
}
