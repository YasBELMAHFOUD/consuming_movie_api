import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class TmdbRemoteDataSource {
  final Dio dio = Dio();
  TmdbRemoteDataSource() {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 120,
      enabled: kDebugMode,
    ));
    
  }
  final String apiKey = '6d0f6680c900ce71d6f46bec0199d7b9';
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<dynamic>> getPopularMovies() async {
    Response response = await dio.get('$baseUrl/movie/popular?api_key=$apiKey');
    
    if (response.statusCode == 200) {
      final data = response.data;
      return data['results'];
    } else {
      throw Exception('Failed to load movies');
    }
  }
}