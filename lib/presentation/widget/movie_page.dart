import 'package:app_filme/presentation/viewmodel/movie_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MovieViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Buscar Filme")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Digite o nome do filme',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  final title = controller.text.trim();
                  if (title.isNotEmpty) {
                    vm.loadMovie(title);
                  }
                },
                child: Text("Buscar", style: TextStyle(color: Colors.blue)),
              ),
            ),

            const SizedBox(height: 20),

            if (vm.loading) const CircularProgressIndicator(),

            if (vm.error != null)
              Text(
                vm.error!,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),

            if (vm.movie != null)
              Expanded(
                child: ListView(
                  children: [
                    if (vm.movie!.poster.isNotEmpty)
                      Image.network(
                        vm.movie!.poster,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.broken_image,
                            size: 160,
                            color: Colors.grey,
                          );
                        },
                      ),
                    const SizedBox(height: 16),
                    Text(
                      vm.movie!.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Ano: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: vm.movie!.year,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Lançamento: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: vm.movie!.released,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Duração: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: vm.movie!.runtime,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Gênero: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: vm.movie!.genre,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Diretor: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: vm.movie!.director,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
