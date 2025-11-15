import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vmp_music/domain/usecases/music/index.dart';
import 'package:vmp_music/domain/usecases/playlist/index.dart';
import 'repository_providers.dart';

// ==================== MUSIC USE CASE PROVIDERS ====================

final getAllMusicUseCaseProvider = Provider<GetAllMusicUseCase>((ref) {
  final repository = ref.watch(musicRepositoryProvider);
  return GetAllMusicUseCase(repository);
});

final addMusicUseCaseProvider = Provider<AddMusicUseCase>((ref) {
  final repository = ref.watch(musicRepositoryProvider);
  return AddMusicUseCase(repository);
});

final addMultipleMusicUseCaseProvider = Provider<AddMultipleMusicUseCase>((ref) {
  final repository = ref.watch(musicRepositoryProvider);
  return AddMultipleMusicUseCase(repository);
});

final deleteMusicUseCaseProvider = Provider<DeleteMusicUseCase>((ref) {
  final repository = ref.watch(musicRepositoryProvider);
  return DeleteMusicUseCase(repository);
});

final searchMusicUseCaseProvider = Provider<SearchMusicUseCase>((ref) {
  final repository = ref.watch(musicRepositoryProvider);
  return SearchMusicUseCase(repository);
});

final toggleFavoriteMusicUseCaseProvider = Provider<ToggleFavoriteMusicUseCase>((ref) {
  final repository = ref.watch(musicRepositoryProvider);
  return ToggleFavoriteMusicUseCase(repository);
});

final getFavoriteMusicUseCaseProvider = Provider<GetFavoriteMusicUseCase>((ref) {
  final repository = ref.watch(musicRepositoryProvider);
  return GetFavoriteMusicUseCase(repository);
});

final getRecentlyPlayedUseCaseProvider = Provider<GetRecentlyPlayedUseCase>((ref) {
  final repository = ref.watch(musicRepositoryProvider);
  return GetRecentlyPlayedUseCase(repository);
});

final updatePlayStatsUseCaseProvider = Provider<UpdatePlayStatsUseCase>((ref) {
  final repository = ref.watch(musicRepositoryProvider);
  return UpdatePlayStatsUseCase(repository);
});

// ==================== PLAYLIST USE CASE PROVIDERS ====================

final getAllPlaylistsUseCaseProvider = Provider<GetAllPlaylistsUseCase>((ref) {
  final repository = ref.watch(playlistRepositoryProvider);
  return GetAllPlaylistsUseCase(repository);
});

final getPlaylistByIdUseCaseProvider = Provider<GetPlaylistByIdUseCase>((ref) {
  final repository = ref.watch(playlistRepositoryProvider);
  return GetPlaylistByIdUseCase(repository);
});

final createPlaylistUseCaseProvider = Provider<CreatePlaylistUseCase>((ref) {
  final repository = ref.watch(playlistRepositoryProvider);
  return CreatePlaylistUseCase(repository);
});

final updatePlaylistUseCaseProvider = Provider<UpdatePlaylistUseCase>((ref) {
  final repository = ref.watch(playlistRepositoryProvider);
  return UpdatePlaylistUseCase(repository);
});

final deletePlaylistUseCaseProvider = Provider<DeletePlaylistUseCase>((ref) {
  final repository = ref.watch(playlistRepositoryProvider);
  return DeletePlaylistUseCase(repository);
});

final addToPlaylistUseCaseProvider = Provider<AddToPlaylistUseCase>((ref) {
  final repository = ref.watch(playlistRepositoryProvider);
  return AddToPlaylistUseCase(repository);
});

final removeFromPlaylistUseCaseProvider = Provider<RemoveFromPlaylistUseCase>((ref) {
  final repository = ref.watch(playlistRepositoryProvider);
  return RemoveFromPlaylistUseCase(repository);
});

final toggleFavoritePlaylistUseCaseProvider = Provider<ToggleFavoritePlaylistUseCase>((ref) {
  final repository = ref.watch(playlistRepositoryProvider);
  return ToggleFavoritePlaylistUseCase(repository);
});

final getFavoritePlaylistsUseCaseProvider = Provider<GetFavoritePlaylistsUseCase>((ref) {
  final repository = ref.watch(playlistRepositoryProvider);
  return GetFavoritePlaylistsUseCase(repository);
});

// ==================== QUEUE USE CASE PROVIDERS ====================
// Note: Queue use cases are handled directly in QueueNotifier for now
// Full queue repository implementation will be added in the next phase
