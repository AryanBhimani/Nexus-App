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
    apiKey: 'AIzaSyC6YWmGWcNJEtXYtztkHXX7wzpbsNVffe0',
    appId: '1:116083366318:web:0ba290aaee954e7755103f',
    messagingSenderId: '116083366318',
    projectId: 'nexus-app-58965',
    authDomain: 'nexus-app-58965.firebaseapp.com',
    storageBucket: 'nexus-app-58965.firebasestorage.app',
    measurementId: 'G-SDMJB5SPN7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbroQYNB0SHBHKsUXdGfNWDuOgvpESRrM',
    appId: '1:116083366318:android:ab6eb71ef0bf59b755103f',
    messagingSenderId: '116083366318',
    projectId: 'nexus-app-58965',
    storageBucket: 'nexus-app-58965.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAbDYvbOXSo7LHnwwTgzJFeb4FW5V6k364',
    appId: '1:116083366318:ios:5addd2173ea6d8dc55103f',
    messagingSenderId: '116083366318',
    projectId: 'nexus-app-58965',
    storageBucket: 'nexus-app-58965.firebasestorage.app',
    iosBundleId: 'com.example.nexusapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAbDYvbOXSo7LHnwwTgzJFeb4FW5V6k364',
    appId: '1:116083366318:ios:5addd2173ea6d8dc55103f',
    messagingSenderId: '116083366318',
    projectId: 'nexus-app-58965',
    storageBucket: 'nexus-app-58965.firebasestorage.app',
    iosBundleId: 'com.example.nexusapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC6YWmGWcNJEtXYtztkHXX7wzpbsNVffe0',
    appId: '1:116083366318:web:501b28b818f1d2da55103f',
    messagingSenderId: '116083366318',
    projectId: 'nexus-app-58965',
    authDomain: 'nexus-app-58965.firebaseapp.com',
    storageBucket: 'nexus-app-58965.firebasestorage.app',
    measurementId: 'G-858MN31TD5',
  );
}
