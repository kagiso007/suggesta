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
    apiKey: 'AIzaSyCMK-cuCuBLFGEUw_gfHMxOeFatBLd2p_o',
    appId: '1:789291224718:web:2fe79ffd88a91c665643df',
    messagingSenderId: '789291224718',
    projectId: 'suggesta-6e4aa',
    authDomain: 'suggesta-6e4aa.firebaseapp.com',
    storageBucket: 'suggesta-6e4aa.appspot.com',
    measurementId: 'G-70LF0VF5NL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDo6BbtwixN9uvRcu1TN2wMUtlrgz4B8Mo',
    appId: '1:789291224718:android:e6d1913dd679cc995643df',
    messagingSenderId: '789291224718',
    projectId: 'suggesta-6e4aa',
    storageBucket: 'suggesta-6e4aa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCo6f1cbNRPU7zEu6O8NX-faJ0p2i-C340',
    appId: '1:789291224718:ios:5bafe8cb92c7ffdc5643df',
    messagingSenderId: '789291224718',
    projectId: 'suggesta-6e4aa',
    storageBucket: 'suggesta-6e4aa.appspot.com',
    iosBundleId: 'com.example.suggesta',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCo6f1cbNRPU7zEu6O8NX-faJ0p2i-C340',
    appId: '1:789291224718:ios:5bafe8cb92c7ffdc5643df',
    messagingSenderId: '789291224718',
    projectId: 'suggesta-6e4aa',
    storageBucket: 'suggesta-6e4aa.appspot.com',
    iosBundleId: 'com.example.suggesta',
  );
}
