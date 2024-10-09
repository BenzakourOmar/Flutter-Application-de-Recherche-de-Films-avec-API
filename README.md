TP Flutter : Application de Recherche de Films
avec API
Objectifs :
• Appeler une API dans Flutter.
• Manipuler et afficher dynamiquement des listes.
• Utiliser des widgets comme ListView, Card, et TextField.
• Naviguer entre écrans et passer des données.
Pré-requis :
• SDK Flutter installé.
• IDE (Android Studio ou VS Code).
• Connexion Internet pour l’API.
• Clé API OMDb (https://www.omdbapi.com/).
Partie 1 : Créer un nouveau projet Flutter
1. Ouvrez le terminal ou votre IDE et créez un nouveau projet :
flutter create tp_flutter_movie_search
2. Accédez au dossier :
cd tp_flutter_movie_search
3. Ouvrez le projet dans votre IDE.
Partie 2 : Ajouter la dépendance http
1. Exécutez :
flutter pub add http
Partie 3 : Construire l’interface utilisateur
Dans le fichier lib/main.dart, des morceaux de code sont manquants.
Complétez-les pour construire l’application.
Étape 1 : L’architecture de l’application
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
// TODO: Implémentez cette méthode pour appeler l'API et récupérer les films
Future<void> fetchMovies(String query) async {
// Complétez ici
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
// TODO: Complétez la TextField pour saisir le titre du film
// TODO: Affichez la liste des films ou un message si aucun résultat
],
),
),
);
}
}
Étape 2 : Détails du film
Complétez la classe MovieDetailPage pour afficher les informations détaillées
d’un film sélectionné :
// TODO: Créez une nouvelle page pour afficher les détails d'un film
class MovieDetailPage extends StatelessWidget {
final Map movie;
MovieDetailPage({required this.movie});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
// TODO: Affichez le titre du film
),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
// TODO: Affichez l'image et les détails du film (année, type)
],
),
),
);
}
}
Explication des tâches manquantes
1. fetchMovies : Vous devez appeler l’API OMDb avec la clé et décoder la
réponse JSON pour afficher les films.
2. TextField : Assurez-vous que la recherche s’effectue lorsqu’un utilisateur
entre un titre et appuie sur le bouton de recherche.
3. ListView : Affichez la liste des films récupérés avec leurs posters et titres.
4. MovieDetailPage : Créez une nouvelle page qui affiche les détails du
film sélectionné à partir de la liste.
Étape 3 : Tester l’application
1. Remplacez YOUR_API_KEY par une clé API valide obtenue depuis OMDb
API.
2. Lancez l’application avec la commande :
flutter run
3. Testez la recherche de films en saisissant des titres dans la barre de
recherche.
Partie 4 : Challenge supplémentaire
1. Pagination : Modifiez l’application pour inclure un bouton “Charger
plus” en bas de la liste des résultats.
2. Gestion des erreurs : Affichez un message si une erreur survient lors de
la requête API.
3. Favoris : Ajoutez la possibilité de marquer des films comme favoris et de
les afficher sur une nouvelle page.
Conclusion
Ce TP vous a permis de : - Rechercher des films via une API. - Manipuler
des données et afficher des listes dynamiques. - Naviguer entre écrans dans une
application Flutter.
