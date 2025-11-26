import 'dart:convert';
import 'package:app_filme/core/result.dart';
import 'package:http/http.dart' as http;

import '../model/movie_model.dart';

class MovieApiService {
  final String apiKey;

  MovieApiService(this.apiKey);

  Future<Result<MovieModel>> getMovie(String title) async {
    final url = Uri.parse('https://www.omdbapi.com/?t=$title&apikey=$apiKey');

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        final jsonBody = jsonDecode(res.body);

        if (jsonBody['Response'] == 'False') {
          return Result.failure(jsonBody['Error'] ?? 'Erro desconhecido');
        }

        final movie = MovieModel.fromJson(jsonBody);
        return Result.success(movie);
      }

      return Result.failure('Erro: ${res.statusCode}');
    } catch (e) {
      return Result.failure('Falha na conexão: $e');
    }
  }
}
