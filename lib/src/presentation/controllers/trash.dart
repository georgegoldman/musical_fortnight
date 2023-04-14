import 'dart:ffi';

import 'package:aer_v2/src/data/data_sources/db.dart';
import 'package:aer_v2/src/data/repositories/trash_reporitory.dart';
import 'package:aer_v2/src/domain/models/trash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrashController {
  final TrashRepository _trashRepo =
      TrashRepository(FiresbaseDB().initializeDB());

  Future<List<Trash>> getAllTrash() => _trashRepo.getAll();

  Future<void> addTrash(Trash trash) => _trashRepo.insert(trash);

  Future<void> removeTrash(DocumentReference id) => _trashRepo.delete(id);

  Future<void> insert(Trash trash) => _trashRepo.insert(trash);
}
