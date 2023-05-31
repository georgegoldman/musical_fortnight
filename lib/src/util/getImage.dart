import 'package:image_picker/image_picker.dart';

mixin GetImageFromDevice {

  Future<XFile?> getImageUsingCamera() {
    return ImagePicker.platform.getImage(source: ImageSource.camera);
  }

  Future<XFile?> getImageUsingGallery() {
    return ImagePicker().pickImage(source: ImageSource.gallery);
  }
}