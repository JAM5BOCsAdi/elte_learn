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
    apiKey: 'AIzaSyD209esIYreoVkv8ykgI7WYDd3acvRjKO0',
    appId: '1:277402526591:web:595a9d90a75f2711de704a',
    messagingSenderId: '277402526591',
    projectId: 'eltelearn',
    authDomain: 'eltelearn.firebaseapp.com',
    storageBucket: 'eltelearn.appspot.com',
    measurementId: 'G-M1X93K50D5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPqsKqFhAM6HKlfnTGERSpmvM3zeZM8tU',
    appId: '1:277402526591:android:d81ff72fb6652557de704a',
    messagingSenderId: '277402526591',
    projectId: 'eltelearn',
    storageBucket: 'eltelearn.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXLPK8rzrBVYLxYtP0ihfUKh1MpJ8PXeg',
    appId: '1:277402526591:ios:5df758ce6c8035fcde704a',
    messagingSenderId: '277402526591',
    projectId: 'eltelearn',
    storageBucket: 'eltelearn.appspot.com',
    iosClientId: '277402526591-jfgnv128rlqv2bg02mtpb6qretnmm57r.apps.googleusercontent.com',
    iosBundleId: 'com.adam.elteLearn',
  );
}