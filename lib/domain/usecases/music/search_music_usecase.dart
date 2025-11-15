import 'package:vmp_music/domain/entities/music.dart';
import 'package:vmp_music/domain/repositories/music_repository.dart';

/// Use case for searching music tracks by title
class SearchMusicUseCase {
  final IMusicRepository repository;

  SearchMusicUseCase(this.repository);

  /// Execute the use case
  /// [query] the search query (music title)
  /// Returns list of matching music tracks
  Future<List<Music>> call(String query) async {
    if (query.isEmpty) {
      return await repository.getAllMusic();
    }
    return await repository.searchMusicByTitle(query);
  }
}
