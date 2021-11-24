import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class CvTabController extends GetxController {
  final List<String> vacancies = ['test', 'test2'];

  String selectedDropItem = 'test';

  String? fileName;

  void pickFile() async {
    final FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowedExtensions: ['doc']);
    if (result != null) {
      final File file = File(result.files.single.path!);
      fileName = result.files.single.name;
    }
  }
}
