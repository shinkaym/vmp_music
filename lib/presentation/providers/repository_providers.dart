import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmp_music/data/datasources/hive_database.dart';
import 'package:vmp_music/data/datasources/local_music_datasource.dart';
import 'package:vmp_music/data/datasources/local_playlist_datasource.dart';
import 'package:vmp_music/data/repositories/music_repository_impl.dart';
import 'package:vmp_music/data/repositories/playlist_repository_impl.dart';
import 'package:vmp_music/domain/repositories/music_repository.dart';
import 'package:vmp_music/domain/repositories/playlist_repository.dart';

/// Provider for Hive database singleton
final hiveDatabaseProvider = Provider<HiveDatabase>((ref) {
  return HiveDatabase();
});

/// Provider for the local music data source
final localMusicDataSourceProvider = Provider<ILocalMusicDataSource>((ref) {
  final hiveDatabase = ref.watch(hiveDatabaseProvider);
  return LocalMusicDataSource(hiveDatabase);
});

/// Provider for the local playlist data source
final localPlaylistDataSourceProvider = Provider<ILocalPlaylistDataSource>((ref) {
  final hiveDatabase = ref.watch(hiveDatabaseProvider);
  return LocalPlaylistDataSource(hiveDatabase);
});

/// Provider for the music repository implementation
final musicRepositoryProvider = Provider<IMusicRepository>((ref) {
  final dataSource = ref.watch(localMusicDataSourceProvider);
  return MusicRepositoryImpl(dataSource);
});

/// Provider for the playlist repository implementation
final playlistRepositoryProvider = Provider<IPlaylistRepository>((ref) {
  final dataSource = ref.watch(localPlaylistDataSourceProvider);
  return PlaylistRepositoryImpl(dataSource);
});
