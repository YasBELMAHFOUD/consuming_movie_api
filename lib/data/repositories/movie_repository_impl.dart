
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/tmdb_remote_data_source.dart';
import '../models/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final TmdbRemoteDataSource dataSource;

  MovieRepositoryImpl({required this.dataSource});

  @override
  Future<List<Movie>> getPopularMovies() async {
    final results = await dataSource.getPopularMovies();
    return results.map((movie) => MovieModel.fromJson(movie).toEntity()).toList();
  }
}