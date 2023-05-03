import 'package:aer_v2/src/domain/models/trash.dart';
import 'package:aer_v2/src/presentation/controllers/trash.dart';
import 'package:aer_v2/src/presentation/widgets/snackbarNotifier.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class TrashService with SnackbarNotification {
  final TrashController _trashController = TrashController();
  final BuildContext context;
  TrashService({required this.context});

  Future<List<Trash>?> getAllTrash() async {
    try {
      final trash = await _trashController.getAllTrash();
    } catch (e) {
      print(e);
    }
  }

  Future<void> insert(Map<String, dynamic> trash) async {
    try {
      var getUrl = await upload(trash["image"]);
      trash["image"] = getUrl;
      final newTrash = await _trashController.insert(trash);
      print(newTrash);
    } catch (e) {
      print("ok this is working");
      print(e.toString());
    }
  }

  Future<String?> upload(XFile file) async {
    try {
      final newImage = await _trashController.upload(file);
      return newImage.then((res) => res.ref.getDownloadURL());
    } on FirebaseException catch (e) {
      normalNotification(e.message.toString(), context);
    } catch (e) {}
  }
}
