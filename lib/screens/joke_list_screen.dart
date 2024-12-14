import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../models/joke_model.dart';

class JokeListScreen extends StatefulWidget {
  final String type;

  JokeListScreen({required this.type});

  @override
  _JokeListScreenState createState() => _JokeListScreenState();
}

class _JokeListScreenState extends State<JokeListScreen> {
  late Future<List<Joke>> jokes;

  @override
  void initState() {
    super.initState();
    jokes = ApiServices().fetchJokesByType(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.type} Jokes'),
      ),
      body: FutureBuilder<List<Joke>>(
        future: jokes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No jokes available.'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  title: Text(snapshot.data![index].setup),
                  subtitle: Text(snapshot.data![index].punchline),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
