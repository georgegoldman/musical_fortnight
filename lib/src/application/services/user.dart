import 'package:aer_v2/src/presentation/controllers/user.dart';
import 'package:aer_v2/src/presentation/widgets/snackbarNotifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class UserService with SnackbarNotification {
  final UserController _userController = UserController();
  final BuildContext context;
  UserService({required this.context});

  Future<String?> upload(XFile file) async {
    try {
      final newImage = await _userController.upload(file);
      return newImage.then((res) => res.ref.getDownloadURL());
    } on FirebaseException catch (e) {
      normalNotification(e.message.toString(), context);
    } catch (e) {}
  }
}