import 'package:aer_v2/src/data/data_sources/db.dart';
import 'package:aer_v2/src/data/repositories/trash_reporitory.dart';
import 'package:aer_v2/src/domain/models/trash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class TrashController {
  final TrashRepository _trashRepo = TrashRepository(
      db: FiresbaseDB().initializeDB(), storageRef: FirebaseStorage.instance);

  TrashController();

  Future<List<Trash>> getAllTrash() => _trashRepo.getAll();

  Future<void> removeTrash(DocumentReference id) => _trashRepo.delete(id);

  Future<String> insert(Map<String, dynamic> trash) => _trashRepo.insert(trash);
  Future<UploadTask> upload(XFile file) => _trashRepo.uploadImage(file);
}
