import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';
import 'package:vmp_music/core/error/app_exception.dart';
import 'package:vmp_music/domain/entities/music.dart';
import 'package:vmp_music/domain/usecases/music/index.dart';
import 'use_case_providers.dart';

/// State for music library
class MusicLibraryState {
  final List<Music> musicList;
  final bool isLoading;
  final String? error;

  const MusicLibraryState({
    this.musicList = const [],
    this.isLoading = false,
    this.error,
  });

  MusicLibraryState copyWith({
    List<Music>? musicList,
    bool? isLoading,
    String? error,
  }) {
    return MusicLibraryState(
      musicList: musicList ?? this.musicList,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// Notifier for managing music library state
class MusicLibraryNotifier extends StateNotifier<MusicLibraryState> {
  final GetAllMusicUseCase _getAllMusicUseCase;
  final AddMusicUseCase _addMusicUseCase;
  final AddMultipleMusicUseCase _addMultipleMusicUseCase;
  final DeleteMusicUseCase _deleteMusicUseCase;
  final SearchMusicUseCase _searchMusicUseCase;
  final ToggleFavoriteMusicUseCase _toggleFavoriteUseCase;
  final GetFavoriteMusicUseCase _getFavoriteMusicUseCase;
  final UpdatePlayStatsUseCase _updatePlayStatsUseCase;

  MusicLibraryNotifier({
    required GetAllMusicUseCase getAllMusicUseCase,
    required AddMusicUseCase addMusicUseCase,
    required AddMultipleMusicUseCase addMultipleMusicUseCase,
    required DeleteMusicUseCase deleteMusicUseCase,
    required SearchMusicUseCase searchMusicUseCase,
    required ToggleFavoriteMusicUseCase toggleFavoriteUseCase,
    required GetFavoriteMusicUseCase getFavoriteMusicUseCase,
    required UpdatePlayStatsUseCase updatePlayStatsUseCase,
  })  : _getAllMusicUseCase = getAllMusicUseCase,
        _addMusicUseCase = addMusicUseCase,
        _addMultipleMusicUseCase = addMultipleMusicUseCase,
        _deleteMusicUseCase = deleteMusicUseCase,
        _searchMusicUseCase = searchMusicUseCase,
        _toggleFavoriteUseCase = toggleFavoriteUseCase,
        _getFavoriteMusicUseCase = getFavoriteMusicUseCase,
        _updatePlayStatsUseCase = updatePlayStatsUseCase,
        super(const MusicLibraryState());

  /// Load all music from the library
  Future<void> loadAllMusic() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final musicList = await _getAllMusicUseCase.call();
      state = state.copyWith(
        musicList: musicList,
        isLoading: false,
      );
    } on AppException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.message,
      );
    }
  }

  /// Add a new music to the library
  Future<void> addMusic(Music music) async {
    try {
      final addedMusic = await _addMusicUseCase.call(music);
      state = state.copyWith(
        musicList: [...state.musicList, addedMusic],
      );
    } on AppException catch (e) {
      state = state.copyWith(error: e.message);
    }
  }

  /// Add multiple music tracks to the library
  Future<void> addMultipleMusic(List<Music> musicList) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final addedMusicList = await _addMultipleMusicUseCase.call(musicList);
      state = state.copyWith(
        musicList: [...state.musicList, ...addedMusicList],
        isLoading: false,
      );
    } on AppException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.message,
      );
    }
  }

  /// Delete a music from the library
  Future<void> deleteMusic(String musicId) async {
    try {
      await _deleteMusicUseCase.call(musicId);
      state = state.copyWith(
        musicList: state.musicList
            .where((music) => music.id != musicId)
            .toList(),
      );
    } on AppException catch (e) {
      state = state.copyWith(error: e.message);
    }
  }

  /// Search music by title
  Future<List<Music>> searchMusic(String query) async {
    try {
      return await _searchMusicUseCase.call(query);
    } on AppException catch (e) {
      state = state.copyWith(error: e.message);
      return [];
    }
  }

  /// Toggle favorite status of a music
  Future<void> toggleFavorite(String musicId) async {
    try {
      final updatedMusic = await _toggleFavoriteUseCase.call(musicId);
      final updatedList = state.musicList
          .map((music) => music.id == musicId ? updatedMusic : music)
          .toList();
      state = state.copyWith(musicList: updatedList);
    } on AppException catch (e) {
      state = state.copyWith(error: e.message);
    }
  }

  /// Get all favorite music
  Future<List<Music>> getFavoriteMusic() async {
    try {
      return await _getFavoriteMusicUseCase.call();
    } on AppException catch (e) {
      state = state.copyWith(error: e.message);
      return [];
    }
  }

  /// Update play statistics for a music
  Future<void> updatePlayStats(String musicId) async {
    try {
      await _updatePlayStatsUseCase.call(musicId);
      // Reload music list to get updated stats
      await loadAllMusic();
    } on AppException catch (e) {
      state = state.copyWith(error: e.message);
    }
  }

  /// Clear all errors
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// Provider for music library state and notifier
final musicLibraryProvider =
    StateNotifierProvider<MusicLibraryNotifier, MusicLibraryState>((ref) {
  return MusicLibraryNotifier(
    getAllMusicUseCase: ref.watch(getAllMusicUseCaseProvider),
    addMusicUseCase: ref.watch(addMusicUseCaseProvider),
    addMultipleMusicUseCase: ref.watch(addMultipleMusicUseCaseProvider),
    deleteMusicUseCase: ref.watch(deleteMusicUseCaseProvider),
    searchMusicUseCase: ref.watch(searchMusicUseCaseProvider),
    toggleFavoriteUseCase: ref.watch(toggleFavoriteMusicUseCaseProvider),
    getFavoriteMusicUseCase: ref.watch(getFavoriteMusicUseCaseProvider),
    updatePlayStatsUseCase: ref.watch(updatePlayStatsUseCaseProvider),
  );
});
