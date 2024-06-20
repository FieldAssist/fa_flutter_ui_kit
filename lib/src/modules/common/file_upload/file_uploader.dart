import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/src/platform/open_file.dart';

class FileService {
  FileService._();

  static Future<PlatformFile?> pickImage(
      ImageSource source, StateSetter setState) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      return PlatformFile(
        name: "uploaded_image",
        size: 5,
        path: pickedFile.path,
      );
    }
    return null;
  }

  static Future<PlatformFile?> pickDocument(StateSetter setState) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'gif'],
    );

    if (result != null) {
      return result.files.first;
    }
    return null;
  }

  static void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}
