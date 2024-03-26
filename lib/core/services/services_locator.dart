import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_source/remote_movie_data_source.dart';
import 'package:movies_app/movies/data/repos_impl/movies_repo_impl.dart';
import 'package:movies_app/movies/domain/repos/base_movie_repo.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_popular_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_top_rated_usecase.dart';
import 'package:movies_app/movies/presentation/manager/bloc/movies_bloc.dart';

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

    // * MoviesBloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
  }
}
