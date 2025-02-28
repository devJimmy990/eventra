// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      return web;
    }
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
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBpJJd0lM9JFktkWMfiSDW-iKx4jLYMSbM',
    appId: '1:70365746998:web:af4431b2ceaa8229920597',
    messagingSenderId: '70365746998',
    projectId: 'eventra-1eb59',
    authDomain: 'eventra-1eb59.firebaseapp.com',
    storageBucket: 'eventra-1eb59.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLCXqOO8O3Q2EbjL5I7sz4oPNFQA5ttgs',
    appId: '1:70365746998:android:e4a8a53e6d9a08c9920597',
    messagingSenderId: '70365746998',
    projectId: 'eventra-1eb59',
    storageBucket: 'eventra-1eb59.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBg8JQc3qfU9azqH9z-0H1hNiadxSXl56Q',
    appId: '1:70365746998:ios:124f6e28f2fd2b5a920597',
    messagingSenderId: '70365746998',
    projectId: 'eventra-1eb59',
    storageBucket: 'eventra-1eb59.firebasestorage.app',
    iosClientId: '70365746998-gvh1fvrldf385ugv57gpjougphtj0ha4.apps.googleusercontent.com',
    iosBundleId: 'com.example.eventra',
  );
}
