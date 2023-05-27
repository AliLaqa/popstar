import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageHelper {
  ImageHelper({
    ImagePicker? imagePicker,
    ImageCropper? imageCropper,
  })  : _imagePicker = imagePicker ?? ImagePicker();

  final ImagePicker _imagePicker;

  Future<XFile?> pickImage({
    ImageSource source = ImageSource.gallery,
    int imageQulaity = 100,
  }) async {
    return await _imagePicker.pickImage(
        source: source, imageQuality: imageQulaity);
  }
}
