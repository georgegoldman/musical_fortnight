import 'package:aer_v2/src/domain/models/trash.dart';
import 'package:aer_v2/src/presentation/controllers/trash.dart';

class TrashService {
  final TrashController _trashController = TrashController();
  TrashService();

  Future<List<Trash>?> getAllTrash() async {
    try {
      final trash = await _trashController.getAllTrash();
    } catch (e) {
      print(e);
    }
  }

  Future<void> insert(Map<String, dynamic> trash) async {
    try {
      final newTrash = await _trashController.insert(trash);
    } catch (e) {
      print(e);
    }
  }
}
