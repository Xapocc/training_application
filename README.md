# Training Application

## General Information

Training app includes gps tracker, adjustable timer, custom table for displaying images and
localisation into two languages.
> <img src="https://github.com/Xapocc/training_application/blob/master/language_change.gif" height="240"/>

### - Project uses Clean Architecture approach

### - Project uses Cubit for navigation purposes

## Features:

- Task 3 shows "data" text or screen with five error messages with 50/50 chance.
  > <img src="https://github.com/Xapocc/training_application/blob/master/task3.gif" height="240"/>
- Task 4 shows table with images or error message with 50/50 chance.
  - You can see counters of how much times each state appeared.
  - Also app shows the date of the last appearance of them.
  - Timer before loading error/table screen can be set to 1-10 seconds.
  - The app will remember this value for subsequent launches.
  > <img src="https://github.com/Xapocc/training_application/blob/master/task4.gif" height="240"/>
- Gps Tracker allows you to track your movement and then see your path on the map.
  - Tracker has minimal distance filter so you'll not end with 100 or so marked points in one place.
  - Map screen has 2 tabs:
    - Map with drawn path.
    - List of points' coordinates.
  > <img src="https://github.com/Xapocc/training_application/blob/master/gps_tracker.gif" height="240"/>

## Flutter Plugins Used[^1]:

[^1]: Plugins' versions can be found
at "https://github.com/Xapocc/training_application/blob/master/pubspec.yaml"

- fluttertoast
- flutter_cache_manager
- permission_handler
- location
- google_maps_flutter
- google_map_polyline_new
- flutter_google_places
- google_maps_webservice
- intl
- shared_preferences
- path_provider
- auto_size_text
- equatable
- firebase_core
- firebase_database
- flutter_bloc
- flutter_localizations