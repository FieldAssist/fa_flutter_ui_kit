import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/src/platform/open_file.dart';

Future<PlatformFile?> getImage(ImageSource source, StateSetter setState) async {
  final pickedFile = await ImagePicker().pickImage(source: source);

  if (pickedFile != null) {
    return PlatformFile(
      name: "uploaded_file",
      size: 5,
      path: pickedFile.path,
    );
  }
  return null;
}

Future<PlatformFile?> getDocument(StateSetter setState) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'gif'],
  );

  if (result != null) {
    return result.files.first;
  }
  return null;
}

void viewFile(PlatformFile _image) {
  OpenFile.open(_image.path);
}
