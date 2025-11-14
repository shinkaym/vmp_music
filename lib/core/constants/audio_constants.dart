/// Audio format and playback configuration constants
class AudioConstants {
  // Supported audio formats
  static const List<String> supportedAudioFormats = [
    '.mp3',
    '.wav',
    '.aac',
    '.flac',
    '.m4a',
    '.ogg',
    '.wma',
  ];

  // Audio mime types
  static const Map<String, String> audioMimeTypes = {
    'mp3': 'audio/mpeg',
    'wav': 'audio/wav',
    'aac': 'audio/aac',
    'flac': 'audio/flac',
    'm4a': 'audio/mp4',
    'ogg': 'audio/ogg',
    'wma': 'audio/x-ms-wma',
  };

  // Playback constants
  static const double defaultVolume = 1.0;
  static const double minVolume = 0.0;
  static const double maxVolume = 1.0;

  // Notification settings
  static const String notificationChannelId = 'vmp_music_playback';
  static const String notificationChannelName = 'VMP Music Playback';
  static const String notificationChannelDescription = 'VMP Music player controls';

  // Playback speed settings
  static const List<double> availablePlaybackSpeeds = [0.5, 0.75, 1.0, 1.25, 1.5, 2.0];
  static const double defaultPlaybackSpeed = 1.0;

  // Audio buffer settings
  static const Duration bufferDuration = Duration(seconds: 15);
  static const int minBufferSize = 15000; // 15KB
  static const int maxBufferSize = 50000; // 50KB
}

/// Enum for repeat modes
enum RepeatMode {
  off,
  one,
  all,
}

/// Enum for shuffle mode
enum ShuffleMode {
  off,
  on,
}
