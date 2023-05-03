import 'package:aer_v2/src/domain/models/trash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

abstract class ITrashRepository {
  Future<List<Trash>> getAll();
  Future<Trash?> getOne(DocumentReference id);
  Future<void> insert(Map<String, dynamic> trash);
  Future<void> update(Map<String, dynamic> trash);
  Future<void> delete(DocumentReference id);
  Future<void> uploadImage(XFile file);
}
