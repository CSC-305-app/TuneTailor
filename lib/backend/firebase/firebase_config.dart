import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA5fqSMESoCruijrEo9bLfnYbiesOTVot0",
            authDomain: "tune-tailor-z08x0g.firebaseapp.com",
            projectId: "tune-tailor-z08x0g",
            storageBucket: "tune-tailor-z08x0g.appspot.com",
            messagingSenderId: "211779688275",
            appId: "1:211779688275:web:cb51e027c613a4579d73a6"));
  } else {
    await Firebase.initializeApp();
  }
}
