import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreUtil {
  FireStoreUtil._privateConstructor();

  static final FireStoreUtil instance = FireStoreUtil._privateConstructor();

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  FirebaseFirestore get fireStore => _fireStore;
}
