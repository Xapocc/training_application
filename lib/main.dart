import 'package:flutter/material.dart';
import 'package:training_application/app/app_root.dart';
import 'package:training_application/data/repositories/statistic_offline_repository.dart';
import 'package:training_application/data/repositories/task4_offline_repository.dart';
import 'package:training_application/domain/use_cases/use_case_statistic.dart';
import 'package:training_application/domain/use_cases/use_case_time.dart';

Task4TimerUseCase task4TimerUseCase =
    Task4TimerUseCase(repository: Task4OfflineRepositoryImpl());

StatisticUseCase statisticUseCase =
    StatisticUseCase(repository: StatisticOfflineRepositoryImpl());

void main() {
  runApp(AppRoot());
}
