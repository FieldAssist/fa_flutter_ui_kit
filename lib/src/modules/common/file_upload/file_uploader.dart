import 'package:image_picker/image_picker.dart'; // Import for ImagePicker
import 'package:file_picker/file_picker.dart';   // Import for FilePicker
import 'package:open_file/open_file.dart';       // Import for OpenFile

class FileService {
  FileService._();

  /// Picks an image and returns a `PlatformFile`.
  /// The file size should be in MB.
  static Future<PlatformFile?> pickImage(
      ImageSource source, String? name, double? requiredFileSize) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      if (requiredFileSize != null) {
        final fileSizeInBytes = requiredFileSize * 1024 * 1024;
        final pickedFileSize = await pickedFile.length();

        if (pickedFileSize > fileSizeInBytes) {
          throw Exception("File size exceeds the $requiredFileSize MB limit");
        }
      }

      return PlatformFile(
        name: name ?? pickedFile.name,
        size: await pickedFile.length(),
        path: pickedFile.path,
      );
    }

    return null;
  }

  /// Picks a document from the system and returns a `PlatformFile`.
  /// Handled extensions are [pdf, jpeg, jpg, png]. More can be added via the `extensions` parameter.
  static Future<PlatformFile?> pickDocument(
      List<String>? extensions, double? requiredFileSize) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: extensions ?? ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result != null && result.files.isNotEmpty) {
      final pickedFile = result.files.first;

      if (requiredFileSize != null) {
        final fileSizeInBytes = requiredFileSize * 1024 * 1024;

        if (pickedFile.size > fileSizeInBytes) {
          throw Exception("File size exceeds the $requiredFileSize MB limit");
        }
      }

      return pickedFile;
    }

    return null;
  }

  /// Opens the document at the specified path.
  static void openFile(String path) {
    OpenFile.open(path);
  }
}
