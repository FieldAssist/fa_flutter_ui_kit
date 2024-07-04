import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/src/platform/open_file.dart';

class FileService {
  FileService._();

  /// Return the Clicked Image
  /// File Size should be in MB
  static Future<Object?> pickImage(
      ImageSource source, String? name, double? requiredFileSize) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      if (requiredFileSize != null) {
        final fileSize = requiredFileSize * 1024 * 1024;
        final picked = await pickedFile.length();
        if (picked > fileSize) {
          return MyException("File size exceeds the $requiredFileSize MB limit");
        
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

  /// Return the Picked File from the System
  /// handled extensions are [pdf, jpeg, jpg, png]
  /// We can add more via [extension] parameter
  static Future<Object?> pickDocument(
      List<String>? extensions, double? requiredFileSize) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: extensions ??
          [
            'pdf',
            'jpg',
            'jpeg',
            'png',
          ],
    );
    if (result != null) {
      if (requiredFileSize != null) {
        final fileSize = requiredFileSize * 1024 * 1024;
        final picked = await result.files.first.size;
        if (picked > fileSize) {
          return  MyException("File size exceeds the $requiredFileSize MB limit");
          
        }
      }
      return result.files.first;
    }
    return null;
  }

  /// Open the DOC
  static void openFile(String path) {
    OpenFile.open(path);
  }
}
