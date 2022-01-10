import 'package:flutter/material.dart';
import 'package:training_application/app/app_root.dart';
import 'package:training_application/data/repositories/offline_repositories/image_url_repository.dart';
import 'package:training_application/data/repositories/offline_repositories/statistic_offline_repository.dart';
import 'package:training_application/data/repositories/offline_repositories/task4_offline_repository.dart';
import 'package:training_application/domain/use_cases/use_case_image_urls.dart';
import 'package:training_application/domain/use_cases/use_case_statistic.dart';
import 'package:training_application/domain/use_cases/use_case_time.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Task4TimerUseCase? task4TimerUseCase;

StatisticUseCase? statisticUseCase;

ImageUrlsUseCase? imageUrlsUseCase;

FirebaseDatabase? database;

void main() async {
  task4TimerUseCase =
      Task4TimerUseCase(repository: Task4OfflineRepositoryImpl());
  statisticUseCase =
      StatisticUseCase(repository: StatisticOfflineRepositoryImpl());
  imageUrlsUseCase = ImageUrlsUseCase(repository: ImageUrlsRepositoryImpl());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  database = FirebaseDatabase.instance;
  database!.setPersistenceEnabled(true);

  runApp(AppRoot());
}
