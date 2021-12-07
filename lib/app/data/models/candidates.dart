import 'dart:convert';
import 'dart:io';

import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

class Candidates {
  Candidates(
      {required this.firstName,
      required this.lastName,
      required this.email,
      this.file,
      this.cvFile,
      this.vacancy});

  final String firstName;
  final String lastName;
  final String email;
  final File? file;
  final String? cvFile;
  final int? vacancy;

  Future<void> createFile() async {
    Uint8List bytes = base64.decode(cvFile ?? '');
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File(
      "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".pdf",
    );
    await file.writeAsBytes(bytes);
  }

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

  // ignore: sort_constructors_first
  factory Candidates.test() {
    return Candidates(
      firstName: 'Daria',
      lastName: 'Koshkina',
      email: 'test@gmail.com',
      vacancy: 2,
    );
  }
}
