import 'package:riverpod/legacy.dart';
import 'package:vmp_music/core/audio/audio_service.dart';
import 'package:vmp_music/core/audio/metadata_extractor.dart';
import 'package:vmp_music/domain/usecases/audio_player_usecase.dart';

/// Provider for AudioServiceImpl (singleton)
final audioServiceProvider = Provider<AudioServiceImpl>((ref) {
  return AudioServiceImpl();
});

/// Provider for MetadataExtractorService (singleton)
final metadataExtractorProvider = Provider<MetadataExtractorService>((ref) {
  return MetadataExtractorService();
});

/// Provider for AudioPlayerUseCase
final audioPlayerUseCaseProvider = Provider<AudioPlayerUseCase>((ref) {
  final audioService = ref.watch(audioServiceProvider);
  final metadataService = ref.watch(metadataExtractorProvider);

  return AudioPlayerUseCase(
    audioService: audioService,
    metadataExtractorService: metadataService,
  );
});

/// FutureProvider to initialize audio service
final audioServiceInitProvider = FutureProvider<void>((ref) async {
  final audioService = ref.watch(audioServiceProvider);
  await audioService.initialize();
});
