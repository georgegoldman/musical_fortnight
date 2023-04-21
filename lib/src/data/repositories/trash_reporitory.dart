import 'package:aer_v2/src/data/repositories/trash_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aer_v2/src/domain/models/trash.dart';

class TrashRepository implements ITrashRepository {
  final FirebaseFirestore db;
  TrashRepository({required this.db});

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
  Future<String> insert(Map<String, dynamic> trash) async {
    var x = await db.collection("trash").add(trash);

    return x.id;
  }

  @override
  Future<void> update(Map<String, dynamic> trash) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
