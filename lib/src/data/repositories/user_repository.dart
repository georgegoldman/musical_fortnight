import 'dart:io';

import 'package:aer_v2/src/data/repositories/user_interface.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository implements IUserRepository {
  final FirebaseStorage storageRef;

  UserRepository({required this.storageRef});

  @override
  Future<UploadTask> updateImage(XFile file) async{
    File toFIle = File(file.path);
    final metadata = SettableMetadata(contentType: "image/jpg");
    final uploadTask = storageRef.ref().child(file.path).putFile(toFIle, metadata);
    return uploadTask;
  }

}