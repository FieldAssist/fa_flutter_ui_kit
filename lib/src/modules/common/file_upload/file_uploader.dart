import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class FileService {
  FileService._();

  /// Picks an image and returns a `PlatformFile`.
  /// The file size should be in MB.
  /// No limit for file size if [requiredFileSize] is null
  /// this will throw error if file size exceeds [requiredFileSize].

  static Future<PlatformFile?> pickImage(ImageSource source, String? name,
      double? requiredFileSize, int? imageQuality) async {
    final pickedFile = await ImagePicker()
        .pickImage(source: source, imageQuality: imageQuality);

    if (pickedFile != null) {
      final pickedFileSize = await pickedFile.length();

      if (requiredFileSize != null) {
        final fileSizeInBytes = requiredFileSize * 1024 * 1024;

        if (pickedFileSize > fileSizeInBytes) {
          throw Exception("File size exceeds the $requiredFileSize MB limit");
        }
      }

      return _XFilePlatformFile(
        pickedFile,
        name: name ?? pickedFile.name,
        size: pickedFileSize,
      );
    }

    return null;
  }

  /// Picks a document from the system and returns a `PlatformFile`.
  /// Handled extensions are [pdf, jpeg, jpg, png]. More can be added via the `extensions` parameter.
  /// The file size should be in MB.
  /// No limit for file size if [requiredFileSize] is null
  /// this will throw error if file size exceeds [requiredFileSize].

  static Future<PlatformFile?> pickDocument(
      List<String>? extensions, double? requiredFileSize) async {
    final pickedFile = await FilePicker.pickFile(
      type: FileType.custom,
      allowedExtensions: extensions ?? ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (pickedFile != null) {
      if (requiredFileSize != null) {
        final fileSizeInBytes = requiredFileSize * 1024 * 1024;

        // An unknown length counts as 0, as `PlatformFile.size` did before
        // file_picker 13.
        if ((await pickedFile.length() ?? 0) > fileSizeInBytes) {
          throw Exception("File size exceeds the $requiredFileSize MB limit");
        }
      }

      return pickedFile;
    }

    return null;
  }
}

/// file_picker 12+ made [PlatformFile] abstract, so an image from
/// image_picker is wrapped to keep [FileService.pickImage]'s return type.
final class _XFilePlatformFile extends PlatformFile {
  _XFilePlatformFile(this.xFile, {required this.name, required int size})
      : _size = size;

  @override
  final XFile xFile;

  @override
  final String name;

  final int _size;

  @override
  Uri get uri => kIsWeb ? Uri.parse(xFile.path) : Uri.file(xFile.path);

  @override
  int? lengthSync() => _size;

  @override
  Future<int?> length() async => _size;

  @override
  Future<Uint8List> readAsBytes() => xFile.readAsBytes();

  @override
  Stream<Uint8List> readAsByteStream() => xFile.openRead();
}
