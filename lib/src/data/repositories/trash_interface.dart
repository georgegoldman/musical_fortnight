import 'package:aer_v2/src/domain/models/trash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class TrashRepository {
  Future<List<Trash>> getAll();
  Future<Trash?> getOne(DocumentReference id);
  Future<void> insert(Trash trash);
  Future<void> update(Trash trash);
  Future<void> delete(DocumentReference id);
}
