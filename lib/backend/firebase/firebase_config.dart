import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBvTKI0nl9J1lbSWZWgGffkhLaW4zkT0Sw",
            authDomain: "vnav-training-h2k50o.firebaseapp.com",
            projectId: "vnav-training-h2k50o",
            storageBucket: "vnav-training-h2k50o.appspot.com",
            messagingSenderId: "671869315217",
            appId: "1:671869315217:web:d9d6f93e8fdbcb77123730"));
  } else {
    await Firebase.initializeApp();
  }
}
