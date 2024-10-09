import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recherche de Films',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieSearchPage(),
    );
  }
}

class MovieSearchPage extends StatefulWidget {
  @override
  _MovieSearchPageState createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {
  final TextEditingController _controller = TextEditingController();
  List movies = [];

  // Méthode pour appeler l'API et récupérer les films
  Future<void> fetchMovies(String query) async {
    final apiKey = '158dce7a'; // Ta clé API ici
    final url = 'http://www.omdbapi.com/?s=$query&apikey=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      setState(() {
        movies = jsonData['Search'] ?? []; // Vérifie s'il y a des résultats
      });
    } else {
      // Gestion d'erreurs
      setState(() {
        movies = [];
      });
      print('Erreur lors de la récupération des films');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recherche de Films'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField pour saisir le titre du film
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Entrez un titre de film',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    fetchMovies(_controller.text);
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            // Affiche la liste des films ou un message si aucun résultat
            movies.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return Card(
                          child: ListTile(
                            leading: Image.network(movie['Poster']),
                            title: Text(movie['Title']),
                            subtitle: Text(movie['Year']),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MovieDetailPage(movie: movie),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                : Text('Aucun film trouvé.'),
          ],
        ),
      ),
    );
  }
}

// Page pour afficher les détails d'un film sélectionné
class MovieDetailPage extends StatelessWidget {
  final Map movie;

  MovieDetailPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie['Title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(movie['Poster']),
            SizedBox(height: 16),
            Text('Titre : ${movie['Title']}', style: TextStyle(fontSize: 24)),
            Text('Année : ${movie['Year']}', style: TextStyle(fontSize: 18)),
            Text('Type : ${movie['Type']}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
