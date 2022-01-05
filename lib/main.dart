import 'package:flutter/material.dart';
import 'package:training_application/app/app_root.dart';
import 'package:training_application/data/repositories/statistic_offline_repository.dart';
import 'package:training_application/data/repositories/task4_offline_repository.dart';

Task4OfflineRepository task4OfflineRepository = Task4OfflineRepository();
StatisticOfflineRepository statisticOfflineRepository =
    StatisticOfflineRepository();

void main() {
  runApp(AppRoot());
}
