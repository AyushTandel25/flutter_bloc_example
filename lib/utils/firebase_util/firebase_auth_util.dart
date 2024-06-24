import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc_example/utils/firebase_util/firebase_crashlytics_util.dart';
import 'package:flutter_bloc_example/utils/firebase_util/firestore_util.dart';

class FirebaseAuthUtil {
  FirebaseAuthUtil._privateConstructor();

  static final FirebaseAuthUtil instance =
      FirebaseAuthUtil._privateConstructor();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseCrashlyticsUtil _crashlyticsUtil = FirebaseCrashlyticsUtil.instance;
  final FireStoreUtil _fireStoreUtil = FireStoreUtil.instance;

  FirebaseAuth get auth => _auth;


  
}
