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
    apiKey: 'AIzaSyD1W9bHQql2RSHLxNb31-SxmbeMvqODMMI',
    appId: '1:851912029096:web:9e0ee750acfff4db22a39d',
    messagingSenderId: '851912029096',
    projectId: 'pi6footed',
    authDomain: 'pi6footed.firebaseapp.com',
    storageBucket: 'pi6footed.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5bi3bbl6-eU7QgVXOqdqs9Hwoki2xr3k',
    appId: '1:851912029096:android:44b37c765425aceb22a39d',
    messagingSenderId: '851912029096',
    projectId: 'pi6footed',
    storageBucket: 'pi6footed.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZDr-Xkx86yHe454VbYAIxIf24tnQSCEg',
    appId: '1:851912029096:ios:e685b39e50cac48122a39d',
    messagingSenderId: '851912029096',
    projectId: 'pi6footed',
    storageBucket: 'pi6footed.appspot.com',
    iosClientId: '851912029096-5rmcps851mg23bk86ce993fkaslo220b.apps.googleusercontent.com',
    iosBundleId: 'com.example.pi6',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZDr-Xkx86yHe454VbYAIxIf24tnQSCEg',
    appId: '1:851912029096:ios:e685b39e50cac48122a39d',
    messagingSenderId: '851912029096',
    projectId: 'pi6footed',
    storageBucket: 'pi6footed.appspot.com',
    iosClientId: '851912029096-5rmcps851mg23bk86ce993fkaslo220b.apps.googleusercontent.com',
    iosBundleId: 'com.example.pi6',
  );
}