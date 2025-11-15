import 'package:vmp_music/core/audio/metadata_extractor.dart';
import 'package:vmp_music/core/error/app_exception.dart';
import 'package:vmp_music/core/error/logger.dart';
import 'package:vmp_music/core/services/file_service.dart';

/// Model for complete file information with metadata
class AudioFileInfo {
  final PickedFileInfo fileInfo;
  final AudioMetadata metadata;

  AudioFileInfo({
    required this.fileInfo,
    required this.metadata,
  });

  /// Get full display title
  String get displayTitle => metadata.displayTitle;

  /// Get full display artist
  String get displayArtist => metadata.displayArtist;

  /// Get full display album
  String get displayAlbum => metadata.displayAlbum;

  /// Get file size in MB
  double get sizeInMB => fileInfo.sizeInMB;

  /// Get formatted duration
  String get formattedDuration => metadata.formattedDuration;
}

/// Service for reading and extracting metadata from audio files
class MetadataReaderService {
  static final MetadataReaderService _instance =
      MetadataReaderService._internal();

  final FileService _fileService = FileService();
  final MetadataExtractorService _metadataExtractor =
      MetadataExtractorService();

  MetadataReaderService._internal();

  factory MetadataReaderService() {
    return _instance;
  }

  /// Read metadata from a file path
  Future<AudioMetadata> readMetadata(String filePath) async {
    try {
      if (!_fileService.fileExists(filePath)) {
        throw FileException(
          message: 'File does not exist: $filePath',
          code: 'file_not_found',
        );
      }

      if (!_metadataExtractor.isAudioFile(filePath)) {
        throw ValidationException(
          message: 'File is not a supported audio format: $filePath',
          code: 'unsupported_format',
        );
      }

      appLogger.info('Reading metadata from: $filePath');
      final metadata = await _metadataExtractor.extractMetadata(filePath);

      return metadata;
    } catch (e) {
      appLogger.error('Error reading metadata from: $filePath', e);
      if (e is AppException) {
        rethrow;
      }
      throw FileException(
        message: 'Failed to read metadata: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Read metadata from multiple file paths
  /// Skips files that fail to read metadata
  Future<List<AudioMetadata>> readMetadataBatch(
    List<String> filePaths,
  ) async {
    try {
      appLogger.info('Reading metadata for ${filePaths.length} files');
      final results = <AudioMetadata>[];

      for (final path in filePaths) {
        try {
          if (!_fileService.fileExists(path)) {
            appLogger.warning('Skipping non-existent file: $path');
            continue;
          }

          if (!_metadataExtractor.isAudioFile(path)) {
            appLogger.warning('Skipping non-audio file: $path');
            continue;
          }

          final metadata = await _metadataExtractor.extractMetadata(path);
          results.add(metadata);
        } catch (e) {
          appLogger.warning('Failed to read metadata for: $path', e);
          continue;
        }
      }

      appLogger.info('Successfully read metadata for ${results.length} files');
      return results;
    } catch (e) {
      appLogger.error('Error reading batch metadata', e);
      if (e is AppException) {
        rethrow;
      }
      throw FileException(
        message: 'Failed to read batch metadata: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Pick a single audio file and read its metadata
  Future<AudioFileInfo?> pickAudioFileWithMetadata() async {
    try {
      final pickedFile = await _fileService.pickAudioFile();

      if (pickedFile == null) {
        return null;
      }

      appLogger.info('Reading metadata for picked file: ${pickedFile.name}');
      final metadata = await readMetadata(pickedFile.path);

      return AudioFileInfo(
        fileInfo: pickedFile,
        metadata: metadata,
      );
    } catch (e) {
      appLogger.error('Error picking audio file with metadata', e);
      if (e is AppException) {
        rethrow;
      }
      throw FileException(
        message: 'Failed to pick audio file with metadata: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Pick multiple audio files and read their metadata
  /// Skips files that fail to read metadata
  Future<List<AudioFileInfo>> pickMultipleAudioFilesWithMetadata() async {
    try {
      final pickedFiles = await _fileService.pickMultipleAudioFiles();

      if (pickedFiles.isEmpty) {
        return [];
      }

      appLogger.info(
        'Reading metadata for ${pickedFiles.length} picked files',
      );
      final results = <AudioFileInfo>[];

      for (final pickedFile in pickedFiles) {
        try {
          final metadata = await readMetadata(pickedFile.path);
          results.add(
            AudioFileInfo(
              fileInfo: pickedFile,
              metadata: metadata,
            ),
          );
        } catch (e) {
          appLogger.warning(
            'Failed to read metadata for: ${pickedFile.name}',
            e,
          );
          continue;
        }
      }

      appLogger.info('Successfully read metadata for ${results.length} files');
      return results;
    } catch (e) {
      appLogger.error('Error picking multiple audio files with metadata', e);
      if (e is AppException) {
        rethrow;
      }
      throw FileException(
        message: 'Failed to pick audio files with metadata: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Update music library with file
  /// This would integrate with the music repository later
  Future<void> updateLibraryWithFile(
    String filePath,
    Future<void> Function(AudioFileInfo) onFileReady,
  ) async {
    try {
      if (!_fileService.fileExists(filePath)) {
        throw FileException(
          message: 'File does not exist: $filePath',
          code: 'file_not_found',
        );
      }

      final metadata = await readMetadata(filePath);
      final pickedFile = PickedFileInfo(
        path: filePath,
        name: _getFilenameFromPath(filePath),
        extension: _getExtensionFromPath(filePath),
      );

      final audioFileInfo = AudioFileInfo(
        fileInfo: pickedFile,
        metadata: metadata,
      );

      await onFileReady(audioFileInfo);
      appLogger.info('Library updated with file: $filePath');
    } catch (e) {
      appLogger.error('Error updating library with file', e);
      if (e is AppException) {
        rethrow;
      }
      throw FileException(
        message: 'Failed to update library with file: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Update music library with multiple files
  Future<List<AudioFileInfo>> updateLibraryWithMultipleFiles(
    List<String> filePaths,
    Future<void> Function(AudioFileInfo) onFileReady,
  ) async {
    try {
      appLogger.info('Updating library with ${filePaths.length} files');
      final results = <AudioFileInfo>[];

      for (final filePath in filePaths) {
        try {
          if (!_fileService.fileExists(filePath)) {
            appLogger.warning('Skipping non-existent file: $filePath');
            continue;
          }

          final metadata = await readMetadata(filePath);
          final pickedFile = PickedFileInfo(
            path: filePath,
            name: _getFilenameFromPath(filePath),
            extension: _getExtensionFromPath(filePath),
          );

          final audioFileInfo = AudioFileInfo(
            fileInfo: pickedFile,
            metadata: metadata,
          );

          await onFileReady(audioFileInfo);
          results.add(audioFileInfo);
        } catch (e) {
          appLogger.warning('Failed to update library with file: $filePath', e);
          continue;
        }
      }

      appLogger.info('Library updated with ${results.length} files');
      return results;
    } catch (e) {
      appLogger.error('Error updating library with multiple files', e);
      if (e is AppException) {
        rethrow;
      }
      throw FileException(
        message: 'Failed to update library with files: ${e.toString()}',
        originalException: e,
      );
    }
  }

  /// Get all supported audio formats
  List<String> getSupportedFormats() {
    return _metadataExtractor.getSupportedFormats();
  }

  /// Check if file is audio format
  bool isAudioFile(String filePath) {
    return _metadataExtractor.isAudioFile(filePath);
  }

  /// Helper method to get filename from path
  String _getFilenameFromPath(String path) {
    final parts = path.split('/');
    return parts.last;
  }

  /// Helper method to get extension from path
  String _getExtensionFromPath(String path) {
    if (path.contains('.')) {
      return path.split('.').last;
    }
    return '';
  }
}
