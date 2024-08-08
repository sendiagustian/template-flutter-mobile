import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/enums/type_enums.dart';

class ImageUtil {
  Future<double> getImageHeight(XFile imageFile) async {
    Completer<double> completer = Completer();

    Image image = Image.file(File(imageFile.path));

    // Use the imageStream to get the image information
    ImageStreamListener listener = ImageStreamListener(
      (ImageInfo imageInfo, bool synchronousCall) {
        completer.complete(imageInfo.image.height.toDouble());
      },
      onError: (dynamic exception, StackTrace? stackTrace) {
        completer.completeError('Error loading image: $exception');
      },
    );

    // Add the listener to the image stream
    image.image.resolve(const ImageConfiguration()).addListener(listener);

    return completer.future;
  }

  Future<bool> loadImages({
    required List<String> imagePaths,
    required ImageSourceType source,
  }) async {
    bool loadedImage = false;
    List<Future<void>> futures = [];

    for (String path in imagePaths) {
      late Image image;
      if (source == ImageSourceType.file) {
        image = Image.file(File(path));
      } else if (source == ImageSourceType.network) {
        image = Image.network(path);
      } else {
        image = Image.asset(path);
      }

      futures.add(Future.forEach(imagePaths, (element) {
        return image.image.resolve(const ImageConfiguration()).addListener(
              ImageStreamListener((ImageInfo info, bool synchronousCall) {}),
            );
      }));
    }

    // Tunggu sampai semua gambar selesai di-load
    await Future.wait(futures).then((value) {
      loadedImage = true;
    });

    return loadedImage;
  }
}
