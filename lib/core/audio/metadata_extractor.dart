import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:vmp_music/core/error/logger.dart';

/// Metadata extracted from an audio file
class AudioMetadata {
  final String? title;
  final String? artist;
  final String? album;
  final String? genre;
  final Duration? duration;
  final String? imageUrl;
  final int? trackNumber;

  const AudioMetadata({
    this.title,
    this.artist,
    this.album,
    this.genre,
    this.duration,
    this.imageUrl,
    this.trackNumber,
  });

  /// Get display title (fallback to filename if no title)
  String get displayTitle => title ?? 'Unknown Title';

  /// Get display artist
  String get displayArtist => artist ?? 'Unknown Artist';

  /// Get display album
  String get displayAlbum => album ?? 'Unknown Album';

  /// Create from file metadata
  static AudioMetadata fromFileMetadata(Metadata metadata, {String? filename}) {
    return AudioMetadata(
      title: metadata.trackName ?? filename ?? 'Unknown',
      artist: metadata.trackArtistNames?.firstOrNull ?? 'Unknown Artist',
      album: metadata.albumName ?? 'Unknown Album',
      genre: metadata.albumGenreNames?.firstOrNull,
      duration: metadata.duration,
      imageUrl: metadata.albumArtwork,
      trackNumber: metadata.trackNumber,
    );
  }

  /// Get duration in readable format (MM:SS)
  String get formattedDuration {
    if (duration == null) return '00:00';
    final minutes = duration!.inMinutes;
    final seconds = duration!.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

/// Service for extracting metadata from audio files
class MetadataExtractorService {
  static final MetadataExtractorService _instance =
      MetadataExtractorService._internal();

  MetadataExtractorService._internal();

  factory MetadataExtractorService() {
    return _instance;
  }

  /// Extract metadata from a file path
  Future<AudioMetadata> extractMetadata(String filePath) async {
    try {
      final metadata = await MetadataRetriever.fromFile(filePath);
      final filename = _getFilenameFromPath(filePath);

      appLogger.i('Metadata extracted for: ${metadata.trackName ?? filename}');
      return AudioMetadata.fromFileMetadata(metadata, filename: filename);
    } catch (e) {
      appLogger.e('Failed to extract metadata from: $filePath', e);
      // Return metadata with filename as fallback
      return AudioMetadata(
        title: _getFilenameFromPath(filePath),
        artist: 'Unknown Artist',
        album: 'Unknown Album',
      );
    }
  }

  /// Extract metadata from multiple file paths
  Future<List<AudioMetadata>> extractMetadataBatch(
    List<String> filePaths,
  ) async {
    final results = <AudioMetadata>[];

    for (final path in filePaths) {
      try {
        final metadata = await extractMetadata(path);
        results.add(metadata);
      } catch (e) {
        appLogger.w('Failed to extract metadata for: $path', e);
      }
    }

    return results;
  }

  /// Get filename from full path
  String _getFilenameFromPath(String path) {
    final parts = path.split('/');
    final filename = parts.last;
    // Remove extension if present
    if (filename.contains('.')) {
      return filename.substring(0, filename.lastIndexOf('.'));
    }
    return filename;
  }

  /// Validate if file is audio format
  bool isAudioFile(String filePath) {
    const audioExtensions = [
      'mp3',
      'wav',
      'aac',
      'flac',
      'm4a',
      'ogg',
      'wma',
      'opus',
    ];

    final extension =
        filePath.split('.').last.toLowerCase();
    return audioExtensions.contains(extension);
  }

  /// Get all supported audio formats
  List<String> getSupportedFormats() {
    return [
      'mp3',
      'wav',
      'aac',
      'flac',
      'm4a',
      'ogg',
      'wma',
      'opus',
    ];
  }
}
