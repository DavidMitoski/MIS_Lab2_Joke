import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../models/joke_model.dart';

class RandomJokeScreen extends StatefulWidget {
  @override
  _RandomJokeScreenState createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  late Future<Joke> randomJoke;

  @override
  void initState() {
    super.initState();
    randomJoke = ApiServices().fetchRandomJoke();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Joke'),
      ),
      body: FutureBuilder<Joke>(
        future: randomJoke,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data!.setup, style: TextStyle(fontSize: 24)),
                SizedBox(height: 20),
                Text(snapshot.data!.punchline, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),
    );
  }
}
