import 'package:aer_v2/src/domain/models/trash.dart';
import 'package:aer_v2/src/presentation/controllers/trash.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

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
      print(newTrash);
    } catch (e) {
      print("ok this is working");
      print(e.toString());
    }
  }
}
