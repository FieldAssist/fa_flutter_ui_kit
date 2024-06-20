import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/src/platform/open_file.dart';

class FileService {
  FileService._();

  /// Return the Clicked Image
  static Future<PlatformFile?> pickImage(
      ImageSource source, String? name) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
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
  static Future<PlatformFile?> pickDocument(List<String>? extensions) async {
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
    if (result != null) return result.files.first;
    return null;
  }

  /// Open the DOC
  static void openFile(String path) {
    OpenFile.open(path);
  }
}
