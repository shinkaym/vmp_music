import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vmp_music/core/constants/audio_constants.dart';
import 'package:vmp_music/core/error/app_exception.dart';
import 'package:vmp_music/core/error/logger.dart';

/// Model for picked file information
class PickedFileInfo {
  final String path;
  final String name;
  final String extension;
  final int? sizeInBytes;

  PickedFileInfo({
    required this.path,
    required this.name,
    required this.extension,
    this.sizeInBytes,
  });

  /// Get size in MB
  double get sizeInMB => (sizeInBytes ?? 0) / (1024 * 1024);

  /// Get display name (without extension)
  String get displayName {
    if (name.contains('.')) {
      return name.substring(0, name.lastIndexOf('.'));
    }
    return name;
  }
}

/// Service for handling file operations
class FileService {
  static final FileService _instance = FileService._internal();

  FileService._internal();

  factory FileService() {
    return _instance;
  }

  /// Pick a single audio file
  /// Returns null if user cancels the picker
  Future<PickedFileInfo?> pickAudioFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
        allowMultiple: false,
        withReadStream: false,
      );

      if (result == null || result.files.isEmpty) {
        appLogger.info('User cancelled audio file picker');
        return null;
      }

      final file = result.files.first;
      final filePath = file.path;

      if (filePath == null) {
        throw FileException(
          message: 'Failed to get file path from picker',
          code: 'invalid_file_path',
        );
      }

      if (!_isValidAudioFile(filePath)) {
        throw FileException(
          message: 'Selected file is not a supported audio format',
          code: 'unsupported_format',
        );
      }

      appLogger.info('Audio file picked: ${file.name}');

      return PickedFileInfo(
        path: filePath,
        name: file.name,
        extension: _getExtension(filePath),
        sizeInBytes: file.size,
      );
    } catch (e) {
      appLogger.error('Error picking audio file', e);
      if (e is AppException) {
        rethrow;
      }
      throw FileException(
        message: 'Failed to pick audio file: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Pick multiple audio files
  /// Returns empty list if user cancels the picker
  Future<List<PickedFileInfo>> pickMultipleAudioFiles() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
        allowMultiple: true,
        withReadStream: false,
      );

      if (result == null || result.files.isEmpty) {
        appLogger.info('User cancelled multiple audio file picker');
        return [];
      }

      final pickedFiles = <PickedFileInfo>[];

      for (final file in result.files) {
        final filePath = file.path;

        if (filePath == null) {
          appLogger.warning('Skipping file with null path: ${file.name}');
          continue;
        }

        if (!_isValidAudioFile(filePath)) {
          appLogger.warning('Skipping unsupported format: ${file.name}');
          continue;
        }

        pickedFiles.add(
          PickedFileInfo(
            path: filePath,
            name: file.name,
            extension: _getExtension(filePath),
            sizeInBytes: file.size,
          ),
        );
      }

      appLogger.info('Picked ${pickedFiles.length} audio files');
      return pickedFiles;
    } catch (e) {
      appLogger.error('Error picking multiple audio files', e);
      if (e is AppException) {
        rethrow;
      }
      throw FileException(
        message: 'Failed to pick audio files: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Pick files from custom file types
  /// [allowedExtensions] - List of extensions without dot (e.g., ['mp3', 'wav'])
  Future<List<PickedFileInfo>> pickCustomFiles({
    required List<String> allowedExtensions,
    bool allowMultiple = false,
  }) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
        allowMultiple: allowMultiple,
        withReadStream: false,
      );

      if (result == null || result.files.isEmpty) {
        appLogger.info('User cancelled custom file picker');
        return [];
      }

      final pickedFiles = <PickedFileInfo>[];

      for (final file in result.files) {
        final filePath = file.path;

        if (filePath == null) {
          appLogger.warning('Skipping file with null path: ${file.name}');
          continue;
        }

        pickedFiles.add(
          PickedFileInfo(
            path: filePath,
            name: file.name,
            extension: _getExtension(filePath),
            sizeInBytes: file.size,
          ),
        );
      }

      appLogger.info('Picked ${pickedFiles.length} custom files');
      return pickedFiles;
    } catch (e) {
      appLogger.error('Error picking custom files', e);
      if (e is AppException) {
        rethrow;
      }
      throw FileException(
        message: 'Failed to pick files: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Clear cache directory
  Future<void> clearCache() async {
    try {
      final cacheDir = await getTemporaryDirectory();

      if (cacheDir.existsSync()) {
        cacheDir.deleteSync(recursive: true);
        appLogger.info('Cache directory cleared');
      }
    } catch (e) {
      appLogger.error('Failed to clear cache', e);
      throw FileException(
        message: 'Failed to clear cache: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Get application documents directory
  Future<String> getDocumentsDirectory() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      return dir.path;
    } catch (e) {
      appLogger.error('Failed to get documents directory', e);
      throw FileException(
        message: 'Failed to get documents directory: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Get application support directory
  Future<String> getSupportDirectory() async {
    try {
      final dir = await getApplicationSupportDirectory();
      return dir.path;
    } catch (e) {
      appLogger.error('Failed to get support directory', e);
      throw FileException(
        message: 'Failed to get support directory: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Get application cache directory
  Future<String> getCacheDirectory() async {
    try {
      final dir = await getTemporaryDirectory();
      return dir.path;
    } catch (e) {
      appLogger.error('Failed to get cache directory', e);
      throw FileException(
        message: 'Failed to get cache directory: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Validate if file is audio format
  bool _isValidAudioFile(String filePath) {
    final extension = _getExtension(filePath).toLowerCase();
    return AudioConstants.supportedAudioFormats.contains('.$extension');
  }

  /// Get file extension without dot
  String _getExtension(String filePath) {
    if (filePath.contains('.')) {
      return filePath.split('.').last;
    }
    return '';
  }

  /// Get all supported audio formats
  List<String> getSupportedAudioFormats() {
    return AudioConstants.supportedAudioFormats
        .map((format) => format.replaceAll('.', ''))
        .toList();
  }

  /// Validate file exists
  bool fileExists(String filePath) {
    try {
      return filePath.isNotEmpty;
    } catch (e) {
      appLogger.warning('Error validating file existence', e);
      return false;
    }
  }
}
