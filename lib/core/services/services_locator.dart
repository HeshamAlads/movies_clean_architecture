import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_source/remote_movie_data_source.dart';
import 'package:movies_app/movies/data/repos_impl/movies_repo_impl.dart';
import 'package:movies_app/movies/domain/repos/base_movie_repo.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_popular_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_recommendations_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_top_rated_usecase.dart';
import 'package:movies_app/movies/presentation/manager/Movies_bloc/movies_bloc.dart';
import 'package:movies_app/movies/presentation/manager/movie_details_bloc/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    //  *Repository
    sl.registerLazySingleton<BaseMoviesRepo>(() => MoviesRepoImpl(sl()));

    //  *Data Source
    sl.registerLazySingleton<BaseRemoteMovieDataSource>(
        () => RemoteMovieDataSourceImpl());

    //  *Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationsUseCase(sl()));

    // * MoviesBloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));

    // * MovieDetailsBloc
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));
  }
}
