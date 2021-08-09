import 'package:image_picker/image_picker.dart';

class ImagePickerUtitlity {
  static pickUserImage() async {
    final picker = ImagePicker();
    var _pickerImage = await picker.pickImage(source: ImageSource.gallery);
    if (_pickerImage != null) {
      return _pickerImage.path;
    }
  }
}
