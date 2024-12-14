import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../models/type_model.dart';
import 'random_joke_screen.dart';
import 'joke_list_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<JokeType>> jokeTypes;

  @override
  void initState() {
    super.initState();
    jokeTypes = ApiServices().fetchJokeTypes(); // Влечење на типови на шеги
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokes App David Mitoski 213221'),
        actions: [
          IconButton(
            icon: Icon(Icons.shuffle),
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RandomJokeScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<JokeType>>(
        future: jokeTypes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No joke types available.'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  title: Text(snapshot.data![index].name),
                  onTap: () {
                    // Навигација до екран за список на шеги по тип
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JokeListScreen(type: snapshot.data![index].name),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
