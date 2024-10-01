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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyAVjgqZgvS0PYBvW0Rda1cN9lVPRx_jTBM',
    appId: '1:172434418199:web:27047c148b860306b38a52',
    messagingSenderId: '172434418199',
    projectId: 'phone-book-app-7f093',
    authDomain: 'phone-book-app-7f093.firebaseapp.com',
    storageBucket: 'phone-book-app-7f093.appspot.com',
    measurementId: 'G-CQRPTRECSS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6dDQsDOb1Qx4OCbHMcOlIdBeCJy8MzaI',
    appId: '1:172434418199:android:c0972f4269937baab38a52',
    messagingSenderId: '172434418199',
    projectId: 'phone-book-app-7f093',
    storageBucket: 'phone-book-app-7f093.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDAvbJPj-H30xQxzs6krlVgD5wupVysyHA',
    appId: '1:172434418199:ios:727d7a81b8445ce7b38a52',
    messagingSenderId: '172434418199',
    projectId: 'phone-book-app-7f093',
    storageBucket: 'phone-book-app-7f093.appspot.com',
    iosBundleId: 'com.example.phoneBookApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDAvbJPj-H30xQxzs6krlVgD5wupVysyHA',
    appId: '1:172434418199:ios:727d7a81b8445ce7b38a52',
    messagingSenderId: '172434418199',
    projectId: 'phone-book-app-7f093',
    storageBucket: 'phone-book-app-7f093.appspot.com',
    iosBundleId: 'com.example.phoneBookApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAVjgqZgvS0PYBvW0Rda1cN9lVPRx_jTBM',
    appId: '1:172434418199:web:f01678c6beab8677b38a52',
    messagingSenderId: '172434418199',
    projectId: 'phone-book-app-7f093',
    authDomain: 'phone-book-app-7f093.firebaseapp.com',
    storageBucket: 'phone-book-app-7f093.appspot.com',
    measurementId: 'G-BMYJJQ688K',
  );
}
