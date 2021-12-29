import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

abstract class StatisticOfflineRepository {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFileStatistics async {
    final path = await _localPath;
    return File('$path/statistics.txt');
  }

  static Future<File> _createEmptyStatisticsFile() async {
    final file = await _localFileStatistics;
    Map<String, dynamic> statistics = {
      "dataStateCounter": 0,
      "errorStateCounter": 0
    };

    return file.writeAsString(jsonEncode(statistics));
  }

  static Future<File> incrementDataStateCounterInFile() async {
    final file = await _localFileStatistics;
    Map<String, dynamic> statistics = await getStateCountersMapFromFile();
    statistics["dataStateCounter"]++;

    return file.writeAsString(jsonEncode(statistics));
  }

  static Future<File> incrementErrorStateCounterInFile() async {
    final file = await _localFileStatistics;
    Map<String, dynamic> statistics = await getStateCountersMapFromFile();
    statistics["errorStateCounter"]++;

    return file.writeAsString(jsonEncode(statistics));
  }

  static Future<int> getDataStateCounterFromFile() async {
    try {
      final file = await _localFileStatistics;

// Read the file
      final contents = await file.readAsString();

      return int.parse(jsonDecode(contents)["dataStateCounter"]);
    } catch (e) {
      _createEmptyStatisticsFile();
      return 0;
    }
  }

  static Future<int> getErrorStateCounterFromFile() async {
    try {
      final file = await _localFileStatistics;

// Read the file
      final contents = await file.readAsString();

      return int.parse(jsonDecode(contents)["errorStateCounter"]);
    } catch (e) {
      _createEmptyStatisticsFile();
      return 0;
    }
  }

  static Future<Map<String, dynamic>> getStateCountersMapFromFile() async {
    try {
      final file = await _localFileStatistics;

// Read the file
      final contents = await file.readAsString();

      return jsonDecode(contents);
    } catch (e) {
      _createEmptyStatisticsFile();
      return {
        "dataStateCounter": 0,
        "errorStateCounter": 0
      };
    }
  }
}
