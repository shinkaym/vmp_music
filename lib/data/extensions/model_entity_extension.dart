import '../models/music_model.dart';
import '../models/playlist_model.dart';
import '../../domain/entities/music.dart';
import '../../domain/entities/playlist.dart';

/// Extensions for converting between data models and domain entities

extension MusicModelToEntity on MusicModel {
  /// Convert MusicModel to Music entity
  Music toEntity() {
    return Music(
      id: id,
      title: title,
      artist: artist,
      album: album,
      filePath: filePath,
      duration: duration,
      dateAdded: dateAdded,
      fileSize: fileSize,
      format: format,
      albumArtPath: albumArtPath,
      isFavorite: isFavorite,
      playCount: playCount,
      lastPlayedAt: lastPlayedAt,
    );
  }
}

extension MusicEntityToModel on Music {
  /// Convert Music entity to MusicModel
  MusicModel toModel() {
    return MusicModel(
      id: id,
      title: title,
      artist: artist,
      album: album,
      filePath: filePath,
      duration: duration,
      dateAdded: dateAdded,
      fileSize: fileSize,
      format: format,
      albumArtPath: albumArtPath,
      isFavorite: isFavorite,
      playCount: playCount,
      lastPlayedAt: lastPlayedAt,
    );
  }
}

extension PlaylistModelToEntity on PlaylistModel {
  /// Convert PlaylistModel to Playlist entity
  Playlist toEntity() {
    return Playlist(
      id: id,
      name: name,
      description: description,
      musicIds: musicIds,
      createdAt: createdAt,
      modifiedAt: modifiedAt,
      coverPath: coverPath,
      isFavorite: isFavorite,
    );
  }
}

extension PlaylistEntityToModel on Playlist {
  /// Convert Playlist entity to PlaylistModel
  PlaylistModel toModel() {
    return PlaylistModel(
      id: id,
      name: name,
      description: description,
      musicIds: musicIds,
      createdAt: createdAt,
      modifiedAt: modifiedAt,
      coverPath: coverPath,
      isFavorite: isFavorite,
    );
  }
}

extension MusicListModelToEntity on List<MusicModel> {
  /// Convert list of MusicModel to list of Music entities
  List<Music> toEntities() {
    return map((model) => model.toEntity()).toList();
  }
}

extension MusicListEntityToModel on List<Music> {
  /// Convert list of Music entities to list of MusicModel
  List<MusicModel> toModels() {
    return map((entity) => entity.toModel()).toList();
  }
}

extension PlaylistListModelToEntity on List<PlaylistModel> {
  /// Convert list of PlaylistModel to list of Playlist entities
  List<Playlist> toEntities() {
    return map((model) => model.toEntity()).toList();
  }
}

extension PlaylistListEntityToModel on List<Playlist> {
  /// Convert list of Playlist entities to list of PlaylistModel
  List<PlaylistModel> toModels() {
    return map((entity) => entity.toModel()).toList();
  }
}
