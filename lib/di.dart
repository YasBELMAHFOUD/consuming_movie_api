import 'package:get/get.dart';
import 'data/datasources/tmdb_remote_data_source.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'domain/usecases/get_popular_movies.dart';
import 'presentation/controllers/movie_controller.dart';

void init() {
  final dataSource = TmdbRemoteDataSource();
  final repository = MovieRepositoryImpl(dataSource: dataSource);
  final getPopularMovies = GetPopularMovies(repository);

  Get.put(MovieController(getPopularMovies: getPopularMovies));
}