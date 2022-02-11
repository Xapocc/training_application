import 'package:flutter/material.dart';
import 'package:training_application/app/app_root.dart';
import 'package:training_application/data/repositories/cache_manager_repositories/location_data_cache_manager_repository.dart';
import 'package:training_application/data/repositories/firebase_rtdb_repositories/image_url_firebase_rtdb_repository.dart';
import 'package:training_application/data/repositories/firebase_rtdb_repositories/statistic_firebase_rtdb_repository.dart';
import 'package:training_application/data/repositories/firebase_rtdb_repositories/statistic_last_date_firebase_rtdb_repository.dart';
import 'package:training_application/data/repositories/firebase_rtdb_repositories/task4_firebase_rtdb_repository.dart';
import 'package:training_application/data/repositories/shared_prefs_repositories/l10n_shared_prefs_repository_impl.dart';
import 'package:training_application/domain/use_cases/use_case_image_urls.dart';
import 'package:training_application/domain/use_cases/use_case_l10n_choose.dart';
import 'package:training_application/domain/use_cases/use_case_locations_data.dart';
import 'package:training_application/domain/use_cases/use_case_statistic.dart';
import 'package:training_application/domain/use_cases/use_case_statistic_last_date.dart';
import 'package:training_application/domain/use_cases/use_case_time.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';

// use cases

Task4TimerUseCase? task4TimerUseCase;

StatisticUseCase? statisticUseCase;
StatisticLastDateUseCase? statisticLastDateUseCase;

ImageUrlsUseCase? imageUrlsUseCase;

LocationsDataUseCase? locationsDataUseCase;

L10nChoiceUseCase? l10nChoiceUseCase;

// other declarations

FirebaseDatabase? database;

dynamic l10n;

FirebaseAuth? auth;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  task4TimerUseCase =
      Task4TimerUseCase(repository: Task4FirebaseRepositoryImpl());
  statisticUseCase =
      StatisticUseCase(repository: StatisticFirebaseRepositoryImpl());

  statisticLastDateUseCase = StatisticLastDateUseCase(
      repository: StatisticLastDateFirebaseRepositoryImpl());

  imageUrlsUseCase =
      ImageUrlsUseCase(repository: ImageUrlsFirebaseRepositoryImpl());

  locationsDataUseCase = LocationsDataUseCase(
      repository: LocationsDataCacheManagerRepositoryImpl());

  l10nChoiceUseCase =
      L10nChoiceUseCase(repository: L10nSharedPrefsRepositoryImpl());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  auth = FirebaseAuth.instance;
  database = FirebaseDatabase.instance;
  database!.setPersistenceEnabled(true);


  runApp(AppRoot());
}
