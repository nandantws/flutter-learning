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
    apiKey: 'AIzaSyBrom1JvWXDQwXlK86NQDtBaCOMKgozuh8',
    appId: '1:335132221960:web:df966079657aa801c367bd',
    messagingSenderId: '335132221960',
    projectId: 'shoeapp-4a35a',
    authDomain: 'shoeapp-4a35a.firebaseapp.com',
    storageBucket: 'shoeapp-4a35a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDoVMTTbeJUIXKvxM4tSpjqxIXJfgvixFg',
    appId: '1:335132221960:android:74c793f094e9e94ac367bd',
    messagingSenderId: '335132221960',
    projectId: 'shoeapp-4a35a',
    storageBucket: 'shoeapp-4a35a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7zXQe34fKp0l0_ke7PFhXLesAqiUYJwU',
    appId: '1:335132221960:ios:7453ffbd7a87530ac367bd',
    messagingSenderId: '335132221960',
    projectId: 'shoeapp-4a35a',
    storageBucket: 'shoeapp-4a35a.appspot.com',
    iosClientId: '335132221960-1e8deejjtltrohaenif21ta69c7m621o.apps.googleusercontent.com',
    iosBundleId: 'com.example.helloworld',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA7zXQe34fKp0l0_ke7PFhXLesAqiUYJwU',
    appId: '1:335132221960:ios:7453ffbd7a87530ac367bd',
    messagingSenderId: '335132221960',
    projectId: 'shoeapp-4a35a',
    storageBucket: 'shoeapp-4a35a.appspot.com',
    iosClientId: '335132221960-1e8deejjtltrohaenif21ta69c7m621o.apps.googleusercontent.com',
    iosBundleId: 'com.example.helloworld',
  );
}
