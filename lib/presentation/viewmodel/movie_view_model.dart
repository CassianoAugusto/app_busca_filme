import 'package:app_filme/core/result.dart';
import 'package:app_filme/domain/fetch_movie_command.dart';
import 'package:app_filme/model/movie_model.dart';
import 'package:app_filme/services/api_service.dart';
import 'package:flutter/material.dart';

class MovieViewModel extends ChangeNotifier {
  final MovieApiService api;

  MovieViewModel(this.api);

  bool loading = false;
  String? error;
  MovieModel? movie;

  Future<void> loadMovie(String title) async {
    loading = true;
    error = null;
    movie = null;
    notifyListeners();

    final command = FetchMovieCommand(api: api, title: title);

    final Result<MovieModel> result = await command.execute();

    loading = false;

    if (result.isSuccess) {
      movie = result.data;
    } else {
      error = result.error;
    }

    notifyListeners();
  }
}
