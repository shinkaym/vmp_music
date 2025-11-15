import 'package:vmp_music/domain/entities/music.dart';
import 'package:vmp_music/domain/repositories/music_repository.dart';

/// Use case for updating play statistics (play count and last played time)
class UpdatePlayStatsUseCase {
  final IMusicRepository repository;

  UpdatePlayStatsUseCase(this.repository);

  /// Execute the use case
  /// [musicId] the ID of the music track to update
  /// Returns the updated music track
  Future<Music> call(String musicId) async {
    return await repository.updatePlayStats(musicId);
  }
}
