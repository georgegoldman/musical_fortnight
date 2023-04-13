import 'package:cloud_firestore/cloud_firestore.dart';

class Trash {
  final String description;

  Trash(this.description);

  factory Trash.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    
  }
}
