// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyCgapBZjBvaLTgdD4_7GbLxsqYOg8RrTPs',
    appId: '1:785208143596:web:a31251cfebebd0e439ffc9',
    messagingSenderId: '785208143596',
    projectId: 'crud-operations-183e2',
    authDomain: 'crud-operations-183e2.firebaseapp.com',
    storageBucket: 'crud-operations-183e2.appspot.com',
    measurementId: 'G-1BWTF1LJSN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0uJ9J2esSgqVaZ_wiP5lcTBy0Gq175cs',
    appId: '1:785208143596:android:ee7c094c78b7bffb39ffc9',
    messagingSenderId: '785208143596',
    projectId: 'crud-operations-183e2',
    storageBucket: 'crud-operations-183e2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDEirfAbfWZptxugN0CtH9YxLXvcIWoXVc',
    appId: '1:785208143596:ios:25feabe54fa43c0339ffc9',
    messagingSenderId: '785208143596',
    projectId: 'crud-operations-183e2',
    storageBucket: 'crud-operations-183e2.appspot.com',
    iosBundleId: 'com.example.contactAppFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDEirfAbfWZptxugN0CtH9YxLXvcIWoXVc',
    appId: '1:785208143596:ios:8c91178184c1786939ffc9',
    messagingSenderId: '785208143596',
    projectId: 'crud-operations-183e2',
    storageBucket: 'crud-operations-183e2.appspot.com',
    iosBundleId: 'com.example.contactAppFirebase.RunnerTests',
  );
}