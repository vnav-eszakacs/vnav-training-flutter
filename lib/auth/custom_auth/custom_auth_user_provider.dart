import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class VnavTrainingAuthUser {
  VnavTrainingAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<VnavTrainingAuthUser> vnavTrainingAuthUserSubject =
    BehaviorSubject.seeded(VnavTrainingAuthUser(loggedIn: false));
Stream<VnavTrainingAuthUser> vnavTrainingAuthUserStream() =>
    vnavTrainingAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
