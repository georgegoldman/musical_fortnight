import 'package:image_picker/image_picker.dart';

abstract class IUserRepository {
  Future<void> updateImage(XFile file);
}