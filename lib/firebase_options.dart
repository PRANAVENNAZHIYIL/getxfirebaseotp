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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3t46E4-nAIgeFeq4nw8gTY9pCGXPExXA',
    appId: '1:1074573832987:android:e691952df2c389f8e719be',
    messagingSenderId: '1074573832987',
    projectId: 'getxlogin-5586d',
    storageBucket: 'getxlogin-5586d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTV7iSVE1dbmuKmErlt-D-uUHULUt0uXY',
    appId: '1:1074573832987:ios:b230ae8739f5a46ee719be',
    messagingSenderId: '1074573832987',
    projectId: 'getxlogin-5586d',
    storageBucket: 'getxlogin-5586d.appspot.com',
    androidClientId: '1074573832987-me619bjrbaigvd6rcd9qe998hpbedc6g.apps.googleusercontent.com',
    iosClientId: '1074573832987-23hs9einl58emlsg0o8j2kf23s5ivctv.apps.googleusercontent.com',
    iosBundleId: 'com.example.getLoginFirebase',
  );
}