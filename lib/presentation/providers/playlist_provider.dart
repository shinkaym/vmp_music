import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';
import 'package:vmp_music/core/error/app_exception.dart';
import 'package:vmp_music/domain/entities/playlist.dart';
import 'package:vmp_music/domain/usecases/playlist/index.dart';
import 'use_case_providers.dart';

/// State for playlists
class PlaylistState {
  final List<Playlist> playlists;
  final Playlist? currentPlaylist;
  final bool isLoading;
  final String? error;

  const PlaylistState({
    this.playlists = const [],
    this.currentPlaylist,
    this.isLoading = false,
    this.error,
  });

  PlaylistState copyWith({
    List<Playlist>? playlists,
    Playlist? currentPlaylist,
    bool? isLoading,
    String? error,
  }) {
    return PlaylistState(
      playlists: playlists ?? this.playlists,
      currentPlaylist: currentPlaylist ?? this.currentPlaylist,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// Notifier for managing playlist state
class PlaylistNotifier extends StateNotifier<PlaylistState> {
  final GetAllPlaylistsUseCase _getAllPlaylistsUseCase;
  final GetPlaylistByIdUseCase _getPlaylistByIdUseCase;
  final CreatePlaylistUseCase _createPlaylistUseCase;
  final UpdatePlaylistUseCase _updatePlaylistUseCase;
  final DeletePlaylistUseCase _deletePlaylistUseCase;
  final AddToPlaylistUseCase _addToPlaylistUseCase;
  final RemoveFromPlaylistUseCase _removeFromPlaylistUseCase;
  final ToggleFavoritePlaylistUseCase _toggleFavoritePlaylistUseCase;
  final GetFavoritePlaylistsUseCase _getFavoritePlaylistsUseCase;

  PlaylistNotifier({
    required GetAllPlaylistsUseCase getAllPlaylistsUseCase,
    required GetPlaylistByIdUseCase getPlaylistByIdUseCase,
    required CreatePlaylistUseCase createPlaylistUseCase,
    required UpdatePlaylistUseCase updatePlaylistUseCase,
    required DeletePlaylistUseCase deletePlaylistUseCase,
    required AddToPlaylistUseCase addToPlaylistUseCase,
    required RemoveFromPlaylistUseCase removeFromPlaylistUseCase,
    required ToggleFavoritePlaylistUseCase toggleFavoritePlaylistUseCase,
    required GetFavoritePlaylistsUseCase getFavoritePlaylistsUseCase,
  })  : _getAllPlaylistsUseCase = getAllPlaylistsUseCase,
        _getPlaylistByIdUseCase = getPlaylistByIdUseCase,
        _createPlaylistUseCase = createPlaylistUseCase,
        _updatePlaylistUseCase = updatePlaylistUseCase,
        _deletePlaylistUseCase = deletePlaylistUseCase,
        _addToPlaylistUseCase = addToPlaylistUseCase,
        _removeFromPlaylistUseCase = removeFromPlaylistUseCase,
        _toggleFavoritePlaylistUseCase = toggleFavoritePlaylistUseCase,
        _getFavoritePlaylistsUseCase = getFavoritePlaylistsUseCase,
        super(const PlaylistState());

  /// Load all playlists
  Future<void> loadAllPlaylists() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final playlists = await _getAllPlaylistsUseCase.call();
      state = state.copyWith(
        playlists: playlists,
        isLoading: false,
      );
    } on AppException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.message,
      );
    }
  }

  /// Get a playlist by ID
  Future<Playlist?> getPlaylistById(String playlistId) async {
    try {
      return await _getPlaylistByIdUseCase.call(playlistId);
    } on AppException catch (e) {
      state = state.copyWith(error: e.message);
      return null;
    }
  }

  /// Create a new playlist
  Future<void> createPlaylist(Playlist playlist) async {
    try {
      final createdPlaylist = await _createPlaylistUseCase.call(playlist);
      state = state.copyWith(
        playlists: [...state.playlists, createdPlaylist],
      );
    } on AppException catch (e) {
      state = state.copyWith(error: e.message);
    }
  }

  /// Update an existing playlist
  Future<void> updatePlaylist(Playlist playlist) async {
    try {
      final updatedPlaylist = await _updatePlaylistUseCase.call(playlist);
      final updatedPlaylists = state.playlists
          .map((p) => p.id == playlist.id ? updatedPlaylist : p)
          .toList();
      state = state.copyWith(
        playlists: updatedPlaylists,
        currentPlaylist: state.currentPlaylist?.id == playlist.id
            ? updatedPlaylist
            : state.currentPlaylist,
      );
    } on AppException catch (e) {
      state = state.copyWith(error: e.message);
    }
  }

  /// Delete a playlist
  Future<void> deletePlaylist(String playlistId) async {
    try {
      await _deletePlaylistUseCase.call(playlistId);
      state = state.copyWith(
        playlists:
            state.playlists.where((p) => p.id != playlistId).toList(),
        currentPlaylist: state.currentPlaylist?.id == playlistId
            ? null
            : state.currentPlaylist,
      );
    } on AppException catch (e) {
      state = state.copyWith(error: e.message);
    }
  }

  /// Add a music to a playlist
  Future<void> addToPlaylist(String playlistId, String musicId) async {
    try {
      final updatedPlaylist =
          await _addToPlaylistUseCase.call(playlistId, musicId);
      final updatedPlaylists = state.playlists
          .map((p) => p.id == playlistId ? updatedPlaylist : p)
          .toList();
      state = state.copyWith(
        playlists: updatedPlaylists,
        currentPlaylist: state.currentPlaylist?.id == playlistId
            ? updatedPlaylist
            : state.currentPlaylist,
      );
    } on AppException catch (e) {
      state = state.copyWith(error: e.message);
    }
  }

  /// Remove a music from a playlist
  Future<void> removeFromPlaylist(String playlistId, String musicId) async {
    try {
      final updatedPlaylist =
          await _removeFromPlaylistUseCase.call(playlistId, musicId);
      final updatedPlaylists = state.playlists
          .map((p) => p.id == playlistId ? updatedPlaylist : p)
          .toList();
      state = state.copyWith(
        playlists: updatedPlaylists,
        currentPlaylist: state.currentPlaylist?.id == playlistId
            ? updatedPlaylist
            : state.currentPlaylist,
      );
    } on AppException catch (e) {
      state = state.copyWith(error: e.message);
    }
  }

  /// Toggle favorite status of a playlist
  Future<void> toggleFavoritePlaylist(String playlistId) async {
    try {
      final updatedPlaylist =
          await _toggleFavoritePlaylistUseCase.call(playlistId);
      final updatedPlaylists = state.playlists
          .map((p) => p.id == playlistId ? updatedPlaylist : p)
          .toList();
      state = state.copyWith(
        playlists: updatedPlaylists,
        currentPlaylist: state.currentPlaylist?.id == playlistId
            ? updatedPlaylist
            : state.currentPlaylist,
      );
    } on AppException catch (e) {
      state = state.copyWith(error: e.message);
    }
  }

  /// Get all favorite playlists
  Future<List<Playlist>> getFavoritePlaylists() async {
    try {
      return await _getFavoritePlaylistsUseCase.call();
    } on AppException catch (e) {
      state = state.copyWith(error: e.message);
      return [];
    }
  }

  /// Set current playlist
  void setCurrentPlaylist(Playlist? playlist) {
    state = state.copyWith(currentPlaylist: playlist);
  }

  /// Clear all errors
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// Provider for playlist state and notifier
final playlistProvider =
    StateNotifierProvider<PlaylistNotifier, PlaylistState>((ref) {
  return PlaylistNotifier(
    getAllPlaylistsUseCase: ref.watch(getAllPlaylistsUseCaseProvider),
    getPlaylistByIdUseCase: ref.watch(getPlaylistByIdUseCaseProvider),
    createPlaylistUseCase: ref.watch(createPlaylistUseCaseProvider),
    updatePlaylistUseCase: ref.watch(updatePlaylistUseCaseProvider),
    deletePlaylistUseCase: ref.watch(deletePlaylistUseCaseProvider),
    addToPlaylistUseCase: ref.watch(addToPlaylistUseCaseProvider),
    removeFromPlaylistUseCase: ref.watch(removeFromPlaylistUseCaseProvider),
    toggleFavoritePlaylistUseCase:
        ref.watch(toggleFavoritePlaylistUseCaseProvider),
    getFavoritePlaylistsUseCase: ref.watch(getFavoritePlaylistsUseCaseProvider),
  );
});
