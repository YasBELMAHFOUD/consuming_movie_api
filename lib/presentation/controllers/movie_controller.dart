import 'package:get/get.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_popular_movies.dart';

class MovieController extends GetxController {
  final GetPopularMovies getPopularMovies;

  MovieController({required this.getPopularMovies});

  var movies = <Movie>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPopularMovies();
    super.onInit();
  }

  Future<void> fetchPopularMovies() async {
    try {
      isLoading(true);
      final result = await getPopularMovies.execute();
      movies.value = result;
    } finally {
      isLoading(false);
    }
  }
}