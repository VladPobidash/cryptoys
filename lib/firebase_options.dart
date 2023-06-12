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
    apiKey: 'AIzaSyDBg6y97cApJl-qzghFv6KixiaLJ5vc8ts',
    appId: '1:1091310325725:web:f0aeec492963b817d83034',
    messagingSenderId: '1091310325725',
    projectId: 'cryptoys-d270a',
    authDomain: 'cryptoys-d270a.firebaseapp.com',
    storageBucket: 'cryptoys-d270a.appspot.com',
    measurementId: 'G-6JKREPGVLZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAoZXKB2w1tu8s_KlVhU3Vp_-KP6UMSVSo',
    appId: '1:1091310325725:android:a259351a783c9f53d83034',
    messagingSenderId: '1091310325725',
    projectId: 'cryptoys-d270a',
    storageBucket: 'cryptoys-d270a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCK26dG4ynMAnEeM5SwdXG2Gbr88riKigw',
    appId: '1:1091310325725:ios:1cf96b7c2a148e84d83034',
    messagingSenderId: '1091310325725',
    projectId: 'cryptoys-d270a',
    storageBucket: 'cryptoys-d270a.appspot.com',
    iosClientId: '1091310325725-38298dup9igd1icnf8sf9aag9826tjrb.apps.googleusercontent.com',
    iosBundleId: 'com.cryptoguys.cryptoCoinsList',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCK26dG4ynMAnEeM5SwdXG2Gbr88riKigw',
    appId: '1:1091310325725:ios:8b14a0442609ee5bd83034',
    messagingSenderId: '1091310325725',
    projectId: 'cryptoys-d270a',
    storageBucket: 'cryptoys-d270a.appspot.com',
    iosClientId: '1091310325725-j88e604k8qfs59ilrgd3ma67ud7hekm0.apps.googleusercontent.com',
    iosBundleId: 'com.cryptoguys.cryptoCoinsList.RunnerTests',
  );
}
