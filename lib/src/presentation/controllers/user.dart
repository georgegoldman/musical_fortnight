import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/repositories/user_repository.dart';

class UserController {

  final UserRepository _userRepo = UserRepository(storageRef: FirebaseStorage.instance);

  UserController();

  Future<UploadTask> upload(XFile file) => _userRepo.updateImage(file);
}