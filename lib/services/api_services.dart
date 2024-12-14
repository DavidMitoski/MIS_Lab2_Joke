// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/joke_model.dart';
// import '../models/type_model.dart';
//
// class ApiServices {
//   // Влечење на типови на шеги
//   Future<List<JokeType>> fetchJokeTypes() async {
//     final response = await http.get(Uri.parse('https://official-joke-api.appspot.com/types'));
//
//     if (response.statusCode == 200) {
//       List<dynamic> typesJson = json.decode(response.body);
//       return typesJson.map((type) => JokeType.fromJson({'name': type})).toList();
//     } else {
//       throw Exception('Failed to load joke types');
//     }
//   }
//
//   // Влечење шеги според тип
//   Future<List<Joke>> fetchJokesByType(String type) async {
//     final response = await http.get(Uri.parse('https://official-joke-api.appspot.com/jokes/$type/ten'));
//
//     if (response.statusCode == 200) {
//       List<dynamic> jokesJson = json.decode(response.body);
//       return jokesJson.map((joke) => Joke.fromJson(joke)).toList();
//     } else {
//       throw Exception('Failed to load jokes');
//     }
//   }
//
//   // Влечење рандом шега
//   Future<Joke> fetchRandomJoke() async {
//     final response = await http.get(Uri.parse('https://official-joke-api.appspot.com/random_joke'));
//
//     if (response.statusCode == 200) {
//       return Joke.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load random joke');
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/joke_model.dart';
import '../models/type_model.dart';

class ApiServices {
  // Влечење на типови на шеги
  Future<List<JokeType>> fetchJokeTypes() async {
    final response = await http.get(Uri.parse('https://official-joke-api.appspot.com/types'));

    if (response.statusCode == 200) {
      List<dynamic> typesJson = json.decode(response.body);
      return typesJson.map((type) => JokeType.fromJson({'name': type})).toList();
    } else {
      throw Exception('Failed to load joke types');
    }
  }

  // Влечење шеги според тип
  Future<List<Joke>> fetchJokesByType(String type) async {
    final response = await http.get(Uri.parse('https://official-joke-api.appspot.com/jokes/$type/ten'));

    if (response.statusCode == 200) {
      List<dynamic> jokesJson = json.decode(response.body);
      return jokesJson.map((joke) => Joke.fromJson(joke)).toList();
    } else {
      throw Exception('Failed to load jokes');
    }
  }

  // Влечење рандом шега
  Future<Joke> fetchRandomJoke() async {
    final response = await http.get(Uri.parse('https://official-joke-api.appspot.com/random_joke'));

    if (response.statusCode == 200) {
      return Joke.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load random joke');
    }
  }
}
