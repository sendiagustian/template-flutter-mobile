// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';

// class FirebaseStorageUtil {
//   FirebaseStorage storage = FirebaseStorage.instance;

//   String _getFileName(File file) {
//     Uri uri = Uri.file(file.path);
//     List<String> pathSegments = uri.pathSegments;

//     // Get the last segment as the file name
//     if (pathSegments.isNotEmpty) {
//       return pathSegments.last;
//     } else {
//       return ''; // Return an empty string if no segments are found
//     }
//   }

//   Future<String?> uploadFile(File file, String destinationPath, {String? fileName}) async {
//     String? imgUrl;
//     SettableMetadata metadata = SettableMetadata(
//       contentType: 'image/jpg',
//       customMetadata: {'picked-file-path': file.path},
//     );

//     Reference ref = storage.ref().child(destinationPath).child(fileName ?? _getFileName(file));
//     var bytes = await file.readAsBytes();

//     try {
//       UploadTask uploadTask = ref.putData(bytes, metadata);
//       imgUrl = await (await uploadTask).ref.getDownloadURL();
//       return imgUrl;
//     } catch (e) {
//       debugPrint(e.toString());
//       return imgUrl;
//     }
//   }

//   Future<File?> downloadAndConvertToFile(String imageUrl) async {
//     try {
//       String image = imageUrl.split('?')[0];
//       // Mendapatkan referensi dari Firebase Storage
//       Reference ref = storage.refFromURL(image);

//       // Mendownload gambar dari Firebase Storage
//       final Directory tempDir = await getTemporaryDirectory();
//       final File tempFile = File('${tempDir.path}/${basename(image)}');
//       await ref.writeToFile(tempFile);

//       // Mengonversi File ke XFile
//       return tempFile;
//     } catch (e) {
//       debugPrint('Error downloading image: $e');
//       return null;
//     }
//   }

//   Future<void> deleteFileByUrlToken(String path) async {
//     try {
//       await storage.ref().child(path).delete();
//     } on FirebaseException catch (e) {
//       debugPrint(e.message);
//     }
//   }
// }
