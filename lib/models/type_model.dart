class JokeType {
  final String name;

  JokeType({required this.name});

  factory JokeType.fromJson(Map<String, dynamic> json) {
    return JokeType(name: json['name']);
  }
}
