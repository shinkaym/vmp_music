import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'app_strings.dart';

/// Supported locales
const List<Locale> supportedLocales = [
  Locale('en', 'US'),
  // Add more locales as needed
  // Locale('es', 'ES'),
  // Locale('fr', 'FR'),
];

/// Default locale
const Locale defaultLocale = Locale('en', 'US');

/// Localization configuration
class LocalizationConfig {
  static late Locale currentLocale;

  /// Initialize localization
  static void init({Locale? initialLocale}) {
    currentLocale = initialLocale ?? defaultLocale;
    Intl.defaultLocale = '${currentLocale.languageCode}_${currentLocale.countryCode}';
  }

  /// Change locale
  static void setLocale(Locale locale) {
    currentLocale = locale;
    Intl.defaultLocale = '${locale.languageCode}_${locale.countryCode}';
  }

  /// Get current locale string
  static String getLocaleString() {
    return '${currentLocale.languageCode}_${currentLocale.countryCode}';
  }
}

/// Localization provider for accessing strings
class L {
  // App
  static String get appName => AppStrings.appName;

  // Common
  static String get ok => AppStrings.ok;
  static String get cancel => AppStrings.cancel;
  static String get save => AppStrings.save;
  static String get delete => AppStrings.delete;
  static String get edit => AppStrings.edit;
  static String get add => AppStrings.add;
  static String get close => AppStrings.close;
  static String get retry => AppStrings.retry;
  static String get back => AppStrings.back;
  static String get done => AppStrings.done;
  static String get loading => AppStrings.loading;
  static String get noData => AppStrings.noData;
  static String get error => AppStrings.error;
  static String get warning => AppStrings.warning;
  static String get success => AppStrings.success;

  // Navigation
  static String get home => AppStrings.home;
  static String get library => AppStrings.library;
  static String get playlists => AppStrings.playlists;
  static String get settings => AppStrings.settings;
  static String get search => AppStrings.search;
  static String get queue => AppStrings.queue;

  // Music Library
  static String get musicLibrary => AppStrings.musicLibrary;
  static String get addMusic => AppStrings.addMusic;
  static String get recentlyAdded => AppStrings.recentlyAdded;
  static String get allSongs => AppStrings.allSongs;
  static String get artists => AppStrings.artists;
  static String get albums => AppStrings.albums;
  static String get genres => AppStrings.genres;
  static String get playlists_ => AppStrings.playlists_;
  static String get favoredTracks => AppStrings.favoredTracks;

  // Player
  static String get nowPlaying => AppStrings.nowPlaying;
  static String get play => AppStrings.play;
  static String get pause => AppStrings.pause;
  static String get resume => AppStrings.resume;
  static String get stop => AppStrings.stop;
  static String get next => AppStrings.next;
  static String get previous => AppStrings.previous;
  static String get shuffle => AppStrings.shuffle;
  static String get repeat => AppStrings.repeat;
  static String get repeatOne => AppStrings.repeatOne;
  static String get repeatAll => AppStrings.repeatAll;

  // Playback
  static String get volume => AppStrings.volume;
  static String get speed => AppStrings.speed;
  static String get duration => AppStrings.duration;
  static String get position => AppStrings.position;
  static String get seek => AppStrings.seek;
  static String get quality => AppStrings.quality;

  // Playlist Management
  static String get createPlaylist => AppStrings.createPlaylist;
  static String get playlistName => AppStrings.playlistName;
  static String get playlistDescription => AppStrings.playlistDescription;
  static String get deletePlaylist => AppStrings.deletePlaylist;
  static String get renamePlaylist => AppStrings.renamePlaylist;
  static String get addToPlaylist => AppStrings.addToPlaylist;
  static String get removeFromPlaylist => AppStrings.removeFromPlaylist;
  static String get playlistSongs => AppStrings.playlistSongs;

  // Queue
  static String get queueEmpty => AppStrings.queueEmpty;
  static String get clearQueue => AppStrings.clearQueue;
  static String get addToQueue => AppStrings.addToQueue;
  static String get removeFromQueue => AppStrings.removeFromQueue;

  // File Operations
  static String get selectFile => AppStrings.selectFile;
  static String get selectFiles => AppStrings.selectFiles;
  static String get selectFolder => AppStrings.selectFolder;
  static String get importing => AppStrings.importing;
  static String get importComplete => AppStrings.importComplete;
  static String get importFailed => AppStrings.importFailed;

  // Metadata
  static String get title => AppStrings.title;
  static String get artist => AppStrings.artist;
  static String get album => AppStrings.album;
  static String get genre => AppStrings.genre;
  static String get releaseDate => AppStrings.releaseDate;
  static String get unknown => AppStrings.unknown;

  // Settings
  static String get settingsTitle => AppStrings.settings;
  static String get appearance => AppStrings.appearance;
  static String get theme => AppStrings.theme;
  static String get lightTheme => AppStrings.lightTheme;
  static String get darkTheme => AppStrings.darkTheme;
  static String get systemTheme => AppStrings.systemTheme;
  static String get language => AppStrings.language;
  static String get audio => AppStrings.audio;
  static String get notifications => AppStrings.notifications;
  static String get about => AppStrings.about;
  static String get version => AppStrings.version;
  static String get privacy => AppStrings.privacy;
  static String get terms => AppStrings.terms;

  // Errors
  static String get errorLoadingMusic => AppStrings.errorLoadingMusic;
  static String get errorPlayingMusic => AppStrings.errorPlayingMusic;
  static String get errorCreatingPlaylist => AppStrings.errorCreatingPlaylist;
  static String get errorDeleteingPlaylist => AppStrings.errorDeleteingPlaylist;
  static String get errorNetworkConnection => AppStrings.errorNetworkConnection;
  static String get errorFileNotFound => AppStrings.errorFileNotFound;
  static String get errorPermissionDenied => AppStrings.errorPermissionDenied;
  static String get errorUnexpected => AppStrings.errorUnexpected;

  // Permission messages
  static String get permissionStorageRequired => AppStrings.permissionStorageRequired;
  static String get permissionNotificationRequired => AppStrings.permissionNotificationRequired;

  // Empty states
  static String get emptyLibrary => AppStrings.emptyLibrary;
  static String get emptyPlaylists => AppStrings.emptyPlaylists;
  static String get emptySearch => AppStrings.emptySearch;
  static String get emptyQueue => AppStrings.emptyQueue;

  // Dialogs
  static String get confirmDelete => AppStrings.confirmDelete;
  static String get confirmDeletePlaylist => AppStrings.confirmDeletePlaylist;
  static String get confirmDeleteSong => AppStrings.confirmDeleteSong;
}
