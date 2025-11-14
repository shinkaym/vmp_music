/// Application-wide configuration constants
class AppConstants {
  // App metadata
  static const String appName = 'VMP Music';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'A personal music player application';

  // Database
  static const String hiveBoxMusic = 'music_box';
  static const String hiveBoxPlaylist = 'playlist_box';
  static const String hiveBoxQueue = 'queue_box';
  static const String hiveBoxSettings = 'settings_box';

  // SharedPreferences keys
  static const String prefLastPlayedTrackId = 'last_played_track_id';
  static const String prefLastPlaybackPosition = 'last_playback_position';
  static const String prefRepeatMode = 'repeat_mode';
  static const String prefShuffleMode = 'shuffle_mode';
  static const String prefSelectedLanguage = 'selected_language';

  // Pagination
  static const int pageSize = 20;
  static const int debounceDelayMs = 500;

  // Timeouts
  static const Duration fileOperationTimeout = Duration(seconds: 30);
  static const Duration audioLoadTimeout = Duration(seconds: 10);
  static const Duration dbOperationTimeout = Duration(seconds: 5);

  // Features
  static const bool enableLogs = true;
  static const bool enableAnalytics = false;
  static const bool enableCrashReporting = false;
}
