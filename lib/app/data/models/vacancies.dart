class Vacancies {
  Vacancies(
      {required this.name, required this.description, required this.keyWords});

  final String name;
  final String description;
  final String keyWords;

  // ignore: sort_constructors_first
  factory Vacancies.fromJson(Map<String, dynamic> json) => Vacancies(
      name: json['name'],
      description: json['description'],
      keyWords: json['key_words']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'key_words': keyWords,
      };

  @override
  bool operator ==(Object other) => other is Vacancies && other.name == name;

  @override
  int get hashCode => name.hashCode;
}
