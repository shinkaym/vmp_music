import 'package:hive_flutter/hive_flutter.dart';
import '../models/music_model.dart';
import '../models/playlist_model.dart';
import '../models/queue_model.dart';
import '../../core/error/index.dart';
import '../../core/constants/index.dart';

/// Hive database service for local data storage
class HiveDatabase {
  static final HiveDatabase _instance = HiveDatabase._internal();

  late Box<MusicModel> _musicBox;
  late Box<PlaylistModel> _playlistBox;
  late Box<QueueModel> _queueBox;
  late Box<String> _settingsBox;

  HiveDatabase._internal();

  factory HiveDatabase() {
    return _instance;
  }

  /// Get music box
  Box<MusicModel> get musicBox => _musicBox;

  /// Get playlist box
  Box<PlaylistModel> get playlistBox => _playlistBox;

  /// Get queue box
  Box<QueueModel> get queueBox => _queueBox;

  /// Get settings box
  Box<String> get settingsBox => _settingsBox;

  /// Check if database is initialized
  bool get isInitialized =>
      _musicBox.isOpen &&
      _playlistBox.isOpen &&
      _queueBox.isOpen &&
      _settingsBox.isOpen;

  /// Initialize Hive database
  Future<void> init() async {
    try {
      appLogger.debug('Initializing Hive database...');

      // Initialize Hive Flutter
      await Hive.initFlutter();

      // Register adapters
      _registerAdapters();

      // Open boxes
      await _openBoxes();

      appLogger.info('✓ Hive database initialized successfully');
    } catch (e, stackTrace) {
      appLogger.error(
        'Failed to initialize Hive database',
        e,
        stackTrace,
      );
      throw DatabaseException(
        message: 'Failed to initialize database: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Register all Hive adapters
  void _registerAdapters() {
    appLogger.debug('Registering Hive adapters...');

    if (!Hive.isAdapterRegistered(musicTypeId)) {
      Hive.registerAdapter(MusicModelAdapter());
      appLogger.debug('Registered MusicModelAdapter');
    }

    if (!Hive.isAdapterRegistered(playlistTypeId)) {
      Hive.registerAdapter(PlaylistModelAdapter());
      appLogger.debug('Registered PlaylistModelAdapter');
    }

    if (!Hive.isAdapterRegistered(queueTypeId)) {
      Hive.registerAdapter(QueueModelAdapter());
      appLogger.debug('Registered QueueModelAdapter');
    }
  }

  /// Open all database boxes
  Future<void> _openBoxes() async {
    appLogger.debug('Opening Hive boxes...');

    _musicBox = await Hive.openBox<MusicModel>(
      AppConstants.hiveBoxMusic,
    );
    appLogger.debug('✓ Opened music box');

    _playlistBox = await Hive.openBox<PlaylistModel>(
      AppConstants.hiveBoxPlaylist,
    );
    appLogger.debug('✓ Opened playlist box');

    _queueBox = await Hive.openBox<QueueModel>(
      AppConstants.hiveBoxQueue,
    );
    appLogger.debug('✓ Opened queue box');

    _settingsBox = await Hive.openBox<String>(
      AppConstants.hiveBoxSettings,
    );
    appLogger.debug('✓ Opened settings box');
  }

  /// Close all boxes
  Future<void> close() async {
    try {
      appLogger.debug('Closing Hive boxes...');
      await Hive.close();
      appLogger.info('✓ Hive database closed');
    } catch (e, stackTrace) {
      appLogger.error('Error closing Hive database', e, stackTrace);
    }
  }

  /// Clear all boxes
  Future<void> clearAll() async {
    try {
      appLogger.warning('Clearing all Hive boxes...');
      await _musicBox.clear();
      await _playlistBox.clear();
      await _settingsBox.clear();
      appLogger.info('✓ All Hive boxes cleared');
    } catch (e, stackTrace) {
      appLogger.error('Error clearing Hive boxes', e, stackTrace);
      throw DatabaseException(
        message: 'Failed to clear database: ${e.toString()}',
        originalException: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Get database statistics
  Map<String, int> getStats() {
    return {
      'music_count': _musicBox.length,
      'playlists_count': _playlistBox.length,
      'queue_count': _queueBox.length,
      'settings_count': _settingsBox.length,
    };
  }
}

/// Singleton instance
final hiveDatabase = HiveDatabase();
