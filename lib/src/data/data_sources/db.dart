import 'package:cloud_firestore/cloud_firestore.dart';

class FiresbaseDB {
  FiresbaseDB();

  FirebaseFirestore initializeDB() {
    return FirebaseFirestore.instance;
  }
}
