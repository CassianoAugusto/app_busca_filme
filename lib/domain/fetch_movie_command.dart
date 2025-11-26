import 'package:app_filme/core/result.dart';
import 'package:app_filme/domain/command.dart';
import 'package:app_filme/services/api_service.dart';

import '../model/movie_model.dart';

class FetchMovieCommand extends Command<Result<MovieModel>> {
  final MovieApiService api;
  final String title;

  FetchMovieCommand({required this.api, required this.title});

  @override
  Future<Result<MovieModel>> execute() async {
    return await api.getMovie(title);
  }
}
