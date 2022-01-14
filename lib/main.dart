import 'package:flutter/material.dart';
import 'package:training_application/app/app_root.dart';
import 'package:training_application/data/repositories/image_url_repository.dart';
import 'package:training_application/data/repositories/statistic_offline_repository.dart';
import 'package:training_application/data/repositories/task4_offline_repository.dart';
import 'package:training_application/domain/use_cases/use_case_image_urls.dart';
import 'package:training_application/domain/use_cases/use_case_statistic.dart';
import 'package:training_application/domain/use_cases/use_case_time.dart';

Task4TimerUseCase? task4TimerUseCase;

StatisticUseCase? statisticUseCase;

ImageUrlsUseCase? imageUrlsUseCase;

void main() {
  task4TimerUseCase =
      Task4TimerUseCase(repository: Task4OfflineRepositoryImpl());
  statisticUseCase =
      StatisticUseCase(repository: StatisticOfflineRepositoryImpl());
  imageUrlsUseCase = ImageUrlsUseCase(repository: ImageUrlsRepositoryImpl());

  runApp(AppRoot());
}
