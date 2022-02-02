import 'package:flutter/material.dart';
import 'package:training_application/app/app_root.dart';
import 'package:training_application/data/repositories/cache_manager_repositories/location_data_cache_manager_repository.dart';
import 'package:training_application/data/repositories/firebase_rtdb_repositories/image_url_firebase_rtdb_repository.dart';
import 'package:training_application/data/repositories/firebase_rtdb_repositories/statistic_firebase_rtdb_repository.dart';
import 'package:training_application/data/repositories/firebase_rtdb_repositories/statistic_last_date_firebase_rtdb_repository.dart';
import 'package:training_application/data/repositories/firebase_rtdb_repositories/task4_firebase_rtdb_repository.dart';
import 'package:training_application/domain/use_cases/use_case_image_urls.dart';
import 'package:training_application/domain/use_cases/use_case_locations_data.dart';
import 'package:training_application/domain/use_cases/use_case_statistic.dart';
import 'package:training_application/domain/use_cases/use_case_statistic_last_date.dart';
import 'package:training_application/domain/use_cases/use_case_time.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

// use cases

Task4TimerUseCase? task4TimerUseCase;

StatisticUseCase? statisticUseCase;
StatisticLastDateUseCase? statisticLastDateUseCase;

ImageUrlsUseCase? imageUrlsUseCase;

LocationsDataUseCase? locationsDataUseCase;

// other declarations

FirebaseDatabase? database;

dynamic l10n;

void main() async {
  task4TimerUseCase =
      Task4TimerUseCase(repository: Task4FirebaseRepositoryImpl());
  statisticUseCase =
      StatisticUseCase(repository: StatisticFirebaseRepositoryImpl());

  statisticLastDateUseCase = StatisticLastDateUseCase(
      repository: StatisticLastDateFirebaseRepositoryImpl());

  imageUrlsUseCase =
      ImageUrlsUseCase(repository: ImageUrlsFirebaseRepositoryImpl());

  locationsDataUseCase = LocationsDataUseCase(repository: LocationsDataCacheManagerRepositoryImpl());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  database = FirebaseDatabase.instance;
  database!.setPersistenceEnabled(true);

  runApp(AppRoot());
}
