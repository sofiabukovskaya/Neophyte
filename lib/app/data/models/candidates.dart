import 'dart:io';

class Candidates {
  Candidates(
      {required this.firstName,
      required this.lastName,
      required this.email,
      this.cvFile,
      this.vacancy});

  final String firstName;
  final String lastName;
  final String email;
  final File? cvFile;
  final int? vacancy;

  // ignore: sort_constructors_first
  factory Candidates.fromJson(Map<String, dynamic> json) => Candidates(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      cvFile: json['sv_file'],
      vacancy: json['vacancy']);

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'sv_file': cvFile,
        'vacancy': vacancy
      };
}
