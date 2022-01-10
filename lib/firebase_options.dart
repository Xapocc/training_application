// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzVGR7U0HF1cqizf7A86_HP_mQHZG8WKQ',
    appId: '1:1046234896813:android:3c2e8819f1f67ee4766924',
    messagingSenderId: '1046234896813',
    projectId: 'training-application-dd0dd',
    storageBucket: 'training-application-dd0dd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCCw9FLTEOiG6IghG1FaTNRGFT_V-V2-SU',
    appId: '1:1046234896813:ios:f8f6b076df1275be766924',
    messagingSenderId: '1046234896813',
    projectId: 'training-application-dd0dd',
    storageBucket: 'training-application-dd0dd.appspot.com',
    iosClientId: '1046234896813-7vj5khbphvl8ia8ottjrv9hdhmlqcd92.apps.googleusercontent.com',
    iosBundleId: 'com.evernetica.training.application',
  );
}