import 'package:aer_v2/src/data/data_sources/db.dart';
import 'package:aer_v2/src/data/repositories/trash_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aer_v2/src/domain/models/trash.dart';

class TrashRepository implements ITrashRepository {
  TrashRepository();
  final db = FiresbaseDB().initializeDB();

  @override
  Future<void> delete(DocumentReference<Object?> id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Trash>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<Trash?> getOne(DocumentReference<Object?> id) {
    // TODO: implement getOne
    throw UnimplementedError();
  }

  @override
  Future<void> insert(Trash trash) {
    db.collection('user').add(trash.toFireStore());
    throw UnimplementedError();
  }

  @override
  Future<void> update(Trash trash) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
