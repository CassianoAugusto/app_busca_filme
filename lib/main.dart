import 'package:app_filme/presentation/widget/movie_page.dart';
import 'package:app_filme/presentation/viewmodel/movie_view_model.dart';
import 'package:app_filme/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MovieViewModel(MovieApiService('cde1f1d4')),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MoviePage(),
    );
  }
}
