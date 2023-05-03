import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class Trash {
  final String? description;
  final String? disposer;
  final XFile? image;

  Trash({this.description, this.disposer, this.image});

  factory Trash.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Trash(
      description: data?['description'],
      disposer: data?['disposer'],
      image: data?['image'],
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      if (description != null) "description": description,
      if (disposer != null) "disposer": disposer,
      if (image != null) "image": image
    };
  }
}
