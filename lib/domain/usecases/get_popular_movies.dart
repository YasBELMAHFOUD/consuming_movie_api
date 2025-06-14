import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<List<Movie>> execute() async {
    return await repository.getPopularMovies();
  }
}