import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class FirebaseCrashlyticsUtil {

  FirebaseCrashlyticsUtil._privateConstructor();

  static final FirebaseCrashlyticsUtil instance = FirebaseCrashlyticsUtil._privateConstructor();

  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  FirebaseCrashlytics get crashlytics => _crashlytics;

}