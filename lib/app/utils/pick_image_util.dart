import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageUtil {
  ImagePicker picker = ImagePicker();

  String getFileType(XFile platformFile) {
    int index = platformFile.name.split('.').length - 1;
    return platformFile.name.split('.')[index];
  }

  String getFileName(XFile platformFile) {
    return platformFile.name.split('.')[0].replaceAll(' ', '_');
  }

  Future<XFile?> pickImage({
    required ImageSource source,
    int? imageQuality,
    double? maxWidth,
  }) async {
    try {
      XFile? pickImage = await picker.pickImage(
        source: source,
        maxWidth: maxWidth,
        imageQuality: imageQuality,
      );
      if (pickImage != null) {
        return XFile(pickImage.path);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('pick image gagal');
      return null;
    }
  }
}
