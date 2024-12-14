import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/random_joke_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke App David Mitoski 213221',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/random': (context) => RandomJokeScreen(),
      },
    );
  }
}
