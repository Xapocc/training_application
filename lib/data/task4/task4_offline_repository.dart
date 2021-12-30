import 'dart:io';

import 'package:path_provider/path_provider.dart';

abstract class Task4OfflineRepository {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFileTime async {
    final path = await _localPath;
    return File('$path/timer.txt');
  }

  static Future<File> saveTimeToFile(int time) async {
    final file = await _localFileTime;
    return file.writeAsString('$time');
  }

  static Future<int> getTimeFromFile() async {
    try {
      final file = await _localFileTime;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      return 1;
    }
  }
}
